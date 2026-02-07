{if $size_guide_enabled}
<div class="viviane-size-guide">
    <h3 class="size-guide-title">
        <i class="material-icons">straighten</i>
        Guide des tailles
    </h3>

    <div class="size-guide-content">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Taille FR</th>
                    <th>Tour de poitrine (cm)</th>
                    <th>Tour de dos (cm)</th>
                    <th>Bonnet</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>80A</td>
                    <td>77-79</td>
                    <td>63-67</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>80B</td>
                    <td>79-81</td>
                    <td>63-67</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>80C</td>
                    <td>81-83</td>
                    <td>63-67</td>
                    <td>C</td>
                </tr>
                <tr>
                    <td>85A</td>
                    <td>82-84</td>
                    <td>68-72</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>85B</td>
                    <td>84-86</td>
                    <td>68-72</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>85C</td>
                    <td>86-88</td>
                    <td>68-72</td>
                    <td>C</td>
                </tr>
                <tr>
                    <td>90A</td>
                    <td>87-89</td>
                    <td>73-77</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>90B</td>
                    <td>89-91</td>
                    <td>73-77</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>90C</td>
                    <td>91-93</td>
                    <td>73-77</td>
                    <td>C</td>
                </tr>
                <tr>
                    <td>95A</td>
                    <td>92-94</td>
                    <td>78-82</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>95B</td>
                    <td>94-96</td>
                    <td>78-82</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>95C</td>
                    <td>96-98</td>
                    <td>78-82</td>
                    <td>C</td>
                </tr>
                <tr>
                    <td>100A</td>
                    <td>97-99</td>
                    <td>83-87</td>
                    <td>A</td>
                </tr>
                <tr>
                    <td>100B</td>
                    <td>99-101</td>
                    <td>83-87</td>
                    <td>B</td>
                </tr>
                <tr>
                    <td>100C</td>
                    <td>101-103</td>
                    <td>83-87</td>
                    <td>C</td>
                </tr>
            </tbody>
        </table>

        <div class="size-tips">
            <h4>Comment mesurer ?</h4>
            <ul>
                <li><strong>Tour de poitrine :</strong> Mesurez horizontalement au point le plus fort de la poitrine</li>
                <li><strong>Tour de dos :</strong> Mesurez juste sous la poitrine</li>
                <li><strong>Bonnet :</strong> La différence entre tour de poitrine et tour de dos détermine le bonnet</li>
            </ul>

            <h4>Correspondance bonnets</h4>
            <ul>
                <li><strong>A :</strong> Différence de 13 cm</li>
                <li><strong>B :</strong> Différence de 15 cm</li>
                <li><strong>C :</strong> Différence de 17 cm</li>
                <li><strong>D :</strong> Différence de 19 cm</li>
                <li><strong>E :</strong> Différence de 21 cm</li>
            </ul>
        </div>
    </div>
</div>

<style>
.viviane-size-guide {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin: 20px 0;
}

.size-guide-title {
    color: #D4366B;
    font-size: 18px;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.size-guide-content table {
    font-size: 14px;
}

.size-guide-content th {
    background: #D4366B;
    color: white;
}

.size-tips {
    margin-top: 20px;
    padding: 15px;
    background: white;
    border-left: 4px solid #D4366B;
}

.size-tips h4 {
    color: #2C3E50;
    margin-bottom: 10px;
    margin-top: 15px;
}

.size-tips h4:first-child {
    margin-top: 0;
}

.size-tips ul {
    padding-left: 20px;
}

.size-tips li {
    margin-bottom: 8px;
}
</style>
{/if}
