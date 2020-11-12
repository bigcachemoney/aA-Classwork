import React from 'react';

class PokemonIndexItem extends React.Component {
  render (){
    return (
      <li>
        {this.props.pokemon.name}
        <img width="20" height="20"
          src={this.props.pokemon.image_url} 
          alt={this.props.pokemon.name} />
      </li>
    );
  }
}

export default PokemonIndexItem;