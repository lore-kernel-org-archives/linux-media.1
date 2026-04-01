Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A31318ED2;
	Wed,  1 Apr 2026 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030143; cv=none; b=Mua9WG2zn4RbxBXxcJC584kHI32+qHk+hr59lri8W8oJFg8MKSaBOxq7dzXfgog/QMfkbKB+EqIBav8RcDEO9GbLT8Pf6Bo1okiAhKV0TWYUMZ3cJFsehkgyKgb764EHc4Al2JfeuDLk6/LMETuNOhUsihAGw23LN662yvwfpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030143; c=relaxed/simple;
	bh=K1iI1eTMzbfbnFiV3leDsXbRtq1EpZqJcXC85aKzHWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+Vj15pwuWR8njBBxUV2H+OTU0tzYb9dT6DnorZGq5BgG/SYXZBSX1UxVx4FYTzU9ksRqohOyzuKJT16Jov7tfhGE+Q/yeHf9GGzQ4NL1zXq+D55NSlMjelSm+HiH2rOuQfm5QuWgaY49+yHjI3kuxAfSmRofOyH835Yv15Mb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t//2N3un; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t//2N3un"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FED1C2BC9E;
	Wed,  1 Apr 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775030143;
	bh=K1iI1eTMzbfbnFiV3leDsXbRtq1EpZqJcXC85aKzHWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t//2N3unxJ6O4aYSBcr5KO2QEYkqoUcok+GKm09GA1MHWxAiTffUsN2JtBekHkJYw
	 kAJm1XaYFoiNnMc8S1gTchtO7CIvfnm2Zp9kMX/COHvE7EbvQaW3ad4FiZWG/8KXZO
	 qni7JEt6hB7+NnYqZNUTkrdy93HPZKVD9lF40D/M9rX7WonAjstkCNOLg2JZ7Izvve
	 obZtbpJdljhdR88iPIYN6Ta1EHU5Z5J7vtOSbefVoMex3isHUHROWAH9i5REsSauAn
	 mUGVZXhfQJ9itQjeOTjBgGBAc5YXzdSmF8EnYn0Nv9elue7hoyE6mfsd9NKDpjhg7o
	 kn9zdy+lbpIxg==
Date: Wed, 1 Apr 2026 09:55:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea Poldi <andrea@riposetti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: hisilicon,hix5hd2-ir: convert to YAML
Message-ID: <20260401-classy-outgoing-ringtail-e4b611@quoll>
References: <20260331145748.39349-1-andrea@riposetti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331145748.39349-1-andrea@riposetti.com>

On Tue, Mar 31, 2026 at 02:58:35PM +0000, Andrea Poldi wrote:
> Convert the HiSilicon Hix5hd2 IR bindings to DT schema.
> 
> Signed-off-by: Andrea Poldi <andrea@riposetti.com>
> ---
>  .../bindings/media/hisilicon,hix5hd2-ir.yaml  | 53 +++++++++++++++++++
>  .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------

Use dfn: on lore. It's your prerequisite for doing conversion.

Binding was already done for three days.

Best regards,
Krzysztof

