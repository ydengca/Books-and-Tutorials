   M S B A M L   `   `   `  ����  WpfMediaPlayer    WpfMediaPlayer.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  
MainWindow��5   	   $	��573��6   $	��525��6)   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��114* �6   �� 5      $
��128* �6   �� 5	      $
��126* �6   �� 5
      $	��45* �6   �� 5      $	��96* �6    � RowDefinitions 5   
   �� 5      $	��21* �6   �� 5      $	��83* �6   .+�5   
   r� -   5         r�Name$ mePlayer��5      $��5��6)   $	��359��6=   $��
10,10,10,0q�6J   $	��Top=�6^    r� UnloadedBehavior$ Manual=�6v    r� LoadedBehavior$ Manual=�6�   $��1��6�   +  %System.Windows.Controls.Ribbon.Ribbon  5   
   $
��Left=�6   $��10,0,0,0q�6,   $	��Top=�6>   $��5��6V   $	��489��6j   $	��108��6v   .@�5      .  (System.Windows.Controls.Ribbon.RibbonTab  $��Video Controls��6   $
��Left=�60   $��57��6K   $	��Top=�6W   $	��487��6o   .@�5      0  *System.Windows.Controls.Ribbon.RibbonGroup  $�� ��6   $��57��6(   $��0q�64   $	��Top=�6?   $	��251��6W   .@�5      �� -   5         ��Name$ btnLoad��5      $
��Load��6.   $��	0,0,-91,0q�6=   6P   �� 5      -   5        $ btnPlay��5      $
��Play��6.    J� RenderTransformOrigin$ 	0.5,2.045&�6=   $��-1,27,-95,-27q�6_   6v   �� 5      -   5        $ btnPause��5      $��Pause��6/   $ 	0.5,2.045&�6?   $��144,2,-240,-2q�6a   6x   �� 5      -   5        $ btnStop��5      $
��Stop��6.   $ 	0.5,2.045&�6=   $��146,29,-242,-29q�6_   6x   5      5      5      5      5      