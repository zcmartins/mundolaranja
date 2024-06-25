import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

const JogPage = () => {
    const { id } = useParams();
    const [jogador, setJogador] = useState(null);

    useEffect(() => {
        const fetchJogador = async () => {
            try {
                const response = await fetch(`http://localhost:3000/jogadores/${id}`);
                if (!response.ok) {
                    throw new Error('Falha ao buscar jogador');
                }
                const data = await response.json();
                setJogador(data);
            } catch (error) {
                console.error('Erro:', error);
            }
        };

        fetchJogador();
    }, [id]);

    if (!jogador) {
        return <p>Carregando jogador...</p>;
    }

    return (
        <div className="bg-gray-500 m-20 md:m-10 max-w-full rounded-xl p-4">
            <h2 className="text-white text-3xl font-bold mb-4">{jogador.nome}</h2>
            <div className="mt-4 text-white">
                <p><strong>Data de Nascimento:</strong> {new Date(jogador.data_nascimento).toLocaleDateString()}</p>
                <p><strong>Cidade de Nascimento:</strong> {jogador.cidade_nascimento}</p>
                <p><strong>Universidade:</strong> {jogador.universidade}</p>
                <p><strong>Resumo:</strong> {jogador.resumo}</p>
            </div>
        </div>
    );
};

export default JogPage;
