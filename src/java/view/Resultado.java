package java.view;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

public class Resultado extends JFrame {

	private JPanel contentPane;

	/**
	 * Create the frame.
	 */
	public Resultado(String resultado) {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 555, 415);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		JButton botaoRecomecar = new JButton("Recomeçar");
		botaoRecomecar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Home home = new Home();
				dispose();
				home.setVisible(true);
				home.setLocationRelativeTo(null);
			}
		});
		botaoRecomecar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		botaoRecomecar.setForeground(new Color(0, 0, 0));
		botaoRecomecar.setBorderPainted(false);
		botaoRecomecar.setBackground(new Color(0, 102, 51));
		botaoRecomecar.setBounds(301, 302, 141, 23);
		contentPane.add(botaoRecomecar);

		JButton botaoSair = new JButton("Sair");
		botaoSair.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		botaoSair.setBorderPainted(false);
		botaoSair.setBackground(new Color(255, 51, 0));
		botaoSair.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		botaoSair.setBounds(118, 302, 141, 23);
		contentPane.add(botaoSair);

		JLabel resultadoTexto = new JLabel(resultado);
		resultadoTexto.setForeground(new Color(255, 0, 51));
		resultadoTexto.setHorizontalAlignment(SwingConstants.CENTER);
		resultadoTexto.setFont(new Font("Tahoma", Font.BOLD, 20));
		resultadoTexto.setBounds(24, 179, 492, 54);
		contentPane.add(resultadoTexto);

		JLabel tituloVoceTirou = new JLabel("Você Tirou :");
		tituloVoceTirou.setForeground(new Color(0, 0, 0));
		tituloVoceTirou.setHorizontalAlignment(SwingConstants.CENTER);
		tituloVoceTirou.setFont(new Font("Tahoma", Font.BOLD, 20));
		tituloVoceTirou.setBounds(24, 149, 492, 33);
		contentPane.add(tituloVoceTirou);

		JLabel boxOpaca = new JLabel("");
		boxOpaca.setOpaque(true);
		boxOpaca.setIcon(null);
		boxOpaca.setBackground(new Color(255, 255, 255, 163));
		boxOpaca.setBounds(24, 68, 492, 280);
		contentPane.add(boxOpaca);

		JLabel tituloResultado = new JLabel("Resultado");
		tituloResultado.setForeground(new Color(255, 255, 255));
		tituloResultado.setFont(new Font("Tahoma", Font.BOLD, 35));
		tituloResultado.setBounds(104, 0, 201, 67);
		contentPane.add(tituloResultado);

		JLabel backgroundImage = new JLabel("");
		backgroundImage.setIcon(new ImageIcon(Resultado.class.getResource("src/assets/backgroundImage.jpg")));
		backgroundImage.setBounds(0, 0, 539, 376);
		contentPane.add(backgroundImage);
	}

}
