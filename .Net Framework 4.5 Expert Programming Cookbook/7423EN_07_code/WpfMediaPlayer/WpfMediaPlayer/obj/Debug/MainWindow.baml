   M S B A M L   `   `   `  ����  WpfMediaPlayer    WpfMediaPlayer.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  
MainWindow��5   	   $	��350��6   $	��525��6)   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��114* �6   �� 5      $
��128* �6   �� 5	      $
��126* �6   �� 5
      $	��45* �6   �� 5      $	��96* �6    � RowDefinitions 5   
   �� 5      $
��259* �6   �� 5      $	��53* �6   .+�5   
   r� -   5         r�Name$ mePlayer��5      $��5��6)   $	��239��6=   $��
10,10,10,0q�6J   $	��Top=�6^    r� UnloadedBehavior$ Manual=�6v    r� LoadedBehavior$ Manual=�6�   �� 5   
   -   5         ��Name$ btnLoad��5      $
��Load��6"   $
��Left=�61   $��	10,21,0,0q�6L   $��1��6_   $	��Top=�6l   $	��100��6�   $��22��6�   6�   �� 5   
   -   5        $ btnPlay��5      $
��Play��6"   $��1��61   $
��Left=�6A   $��	16,21,0,0q�6\   $��1��6o   $	��Top=�6|   $	��102��6�   $��22��6�   6�   �� 5   
   -   5        $ btnPause��5      $��Pause��6#   $��2��63   $
��Left=�6C   $��	13,21,0,0q�6^   $��1��6q   $	��Top=�6~   $	��103��6�   $��22��6�   6�   �� 5   
   -   5        $ btnStop��5      $
��Stop��6"   $��3��61   $
��Left=�6A   $��	14,21,0,0q�6\   $��1��6o   $	��Top=�6|   $	��103��6�   $��22��6�   $��2��6�   6�   5      5      