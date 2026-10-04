Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF03418360
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112948; cv=none; b=u1ef6WYFS+NgonnY3Fxk71Nlif2Vu/UzTX/lB9sx8VqoRL/7OHqbz6Q2T+Umhy8RVQZ0nlOXlYgcx1fibrBHbGbRpIKGtsNCoiiwbmcJb4LR0FUqg/5cViRsgMEnbd4YitJzrFBX9JYlRdZHsyXvFzc8J4Dc1I5DQbr3be5Uh0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112948; c=relaxed/simple;
	bh=+Tna8RsXPPRXKbInAmfO2YP+cNYONp0Al47HO8Eb5ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzfOzbxe3CYKk15p85+098oMVk7k5B19scj9Nb1HJjUS3pHEzPul00bDvBspfgcXgyTdmUozl9wRypN/NFqMr0nk7VTbYOm7TDIKNCYaGDRMW0qLepqkIdkpbhem/yDfrcSxiABvOyzLqcoD2rdbuK59ZLTONDp+D2Dyoj0KeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=D/4YLgrV; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="D/4YLgrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1791112944; bh=+Tna8RsXPPRXKbInAmfO2YP+cNYONp0Al47HO8Eb5ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/4YLgrVwsUl0xk3BCfq9Mtpx4MzCE6SqBs0fIYDAucYLr9K7mMddUppikvhAymx/
	 fX+eRbGOBNq6hezZK1f03Pc5GLwFFd3gk5B2COQEfE4sJJCuOhcf+XAWryFm+dzJTH
	 oj0Buu5F1UpyKAd1fpgIH2pwkmDNhbbQAiySIS7EaKELhOv6BauivxGcObpRRxo7as
	 S3Zz0Bhgx2lA8Rs4ytIaU9aTBbFjjn5D4D99eLV26CQhbCn08w41Sc9ZaeeB2CV054
	 EqhR2gx0/u1FMOO0ssDX/t8cS02MqwOU4PBZ8XQ6nBwZtw1yUnfsNANPYbRt8r7JHZ
	 WQP8Vhl/B6Mkw==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id D9632409E9; Sun, 04 Oct 2026 12:22:24 +0100 (BST)
Date: Sun, 4 Oct 2026 12:22:24 +0100
From: Sean Young <sean@mess.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Message-ID: <asI28A2jio0BY_OP@extorris.mess.org>
References: <20261003211639.23194-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003211639.23194-1-festevam@gmail.com>

On Sat, Oct 03, 2026 at 06:16:38PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Newly introduced. (Sean)
> 
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +

This needs a Cc: devicetree@vger.kernel.org and possibly others.
Check get_maintainer.pl please.
 

Sean

>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index 43d84296e70d..827f4b0a8263 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -105,6 +105,7 @@ properties:
>        - rc-msi-tvanywhere-plus
>        - rc-mygica-utv3
>        - rc-nebula
> +      - rc-nec-ruwido-z3-rc34
>        - rc-nec-terratec-cinergy-xs
>        - rc-norwood
>        - rc-npgtech
> -- 
> 2.43.0
> 
