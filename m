Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B528472789
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268771; cv=pass; b=QZQk5s8iN0lhlXv1mzWRbj0x2G0tIC+Trreo50UOqgoF2Bq7uYb2W8cnIENevXPYGWjT3lOP1efL9aBBNNPIFBZ8ORuWaEQLa65Z64334tk1rU8h0m1m9QFTyUAC884qXTX09zVQR3Lr0rUFpe1D/Tnb2Lu7LO4GX8AjXjJZKrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268771; c=relaxed/simple;
	bh=EUOw3cygDCP6J+CiUq3L+U3hiPS1nD+MSSzfDTv+tIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c95sN81mk6WwAXo4GBHRAkiZYf0yjBnAPiy2sLSl5b5ze27rbkZmIdaHW8gsbjWpRWTuQ61RT/rje2+xlJqao0FC1RsIAd9MvYh7rB8tafNXmoyBxWsMm6JuwQBUuRJEZJyXeR0OGf9OLHS8SE/9Pd5WTl34m674daCL3ND8wT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=DjLdNG05; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="DjLdNG05"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4h8mWZ4L7Dz4BKL5;
	Tue, 28 Jul 2026 22:59:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1785268762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUgZvYUHzk1BRGIgX27bUltAdaPjf28b0q7D3K/uho4=;
	b=DjLdNG051kmf8vmOj5h0YRvozm9O3KYVkTswA3OWeaXr9htPuBGLNMPyED3wMk4bz77pLR
	SChXJhXWuyXIEnBTxhNY+msmlTciTf5DkkQApzUPWCkPWVxTObLIjq/MCypZc7XTZrbVEL
	YXuHDeO4GRUvOYeAAoPF+8Al68dsdc8JeWoHBv4fl47qkYOatYUPYDVPP7hLF4U9TFk6ED
	/QBxP1c65P4z43kRJ4PdNaCZu3dOm9omIBuUJbUypEIhXyiiBKhyL9lYkdisWKXQR+yY/A
	bnWnbp7VBKWK1FpVM6+K8uTDh8c5236lXV/S0ZNIDz+OvjhajCLo6mjzJwQR8Q==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1785268762;
	b=ghdVIxAbXnwk/u4Y54ZcdfA0uNeqeLvhKWQhhZRdrPCWfROENlsiWUagfTfAJqYtHoRV83
	2VBab0pnC4kBVwDOIUz9zUUT/PbRfItLmdmQSFpFiqnEsx+wviaNK5rdlSmvGNb6z1WO2M
	zGxOE5TCiJQ+O0qAJpwb6dt+C3hJ2+t4kVaN7VFBMVAGo1lI20O+O5E8AjarAUbEdyWOvH
	V0MweJqG/35h+VuaJ/ItRqzrrlj9+xKUrmLYyC27iiDeGmwO12M1LT/MoNMS/LdWgGiUXV
	H3kbo3FKVscH84sa84VSNitl0ab3t25QuEniZ3uap/Jpii87Z7RUqxTFmC2JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1785268762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUgZvYUHzk1BRGIgX27bUltAdaPjf28b0q7D3K/uho4=;
	b=MDhVUW1FYiFrcyrnDnJwidxKZzg5xamgv62T4hQ8DZR2mqFvRFcb+PDpeDzqeMXFcB2ACu
	jTbn6YizLcXXDiFK5SIpDRaLzB2SdedAoBrtO70N3RzGMbMuzi6vFtqwqw/Mz+ehlfNkpu
	6gquKzE3ZbzxZANsURG4Mu1UDegvsSc7V6ra38d0vmwuC1u9rZhDS8oI969q+fCjCp88I7
	TAa+4AYo0PT2X796uoCbkc0p+g1/aYP3gOdZhh2fwI4nymqMlfXf4UVZqRcLX6GQkHkPQt
	4wGLEVgDiXqBxVfpKu/E/ukehzIdAoQ6e09iUfvtKK/cZYzq4ddoMI5DFPfSzw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A884B634C65;
	Tue, 28 Jul 2026 22:59:21 +0300 (EEST)
Date: Tue, 28 Jul 2026 22:59:21 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm] [PATCH] Add support for BGRX32, RGBX32, XBGR32 and
 XRGB32 formats
Message-ID: <amkKGVr3hdzHh6AF@valkosipuli.retiisi.eu>
References: <20260720234839.456275-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720234839.456275-1-laurent.pinchart@ideasonboard.com>

On Tue, Jul 21, 2026 at 02:48:39AM +0300, Laurent Pinchart wrote:
> The BGRX32 and RGBX32 formats are missing. They are easy to support as
> they are just permutations of the already supported BGR32 and RGB32
> formats. Add them.
> 
> The XBGR32 and XRGB32 format identifiers are also missing. They
> correspond to the already supported BGR32 and RGB32 formats
> respectively. Add aliases for those two formats.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied!

-- 
Sakari Ailus
