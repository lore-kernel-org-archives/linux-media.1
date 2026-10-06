Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0A31E823
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285228; cv=pass; b=BziCu8bvRpFh8Rwpc5LWacq0FYsK4G7W8lZw6MWjsS1jnjLLHW1L9ISivLl/fvTgneP4vqbA3FNCs+2yAPqVZjGQqAjZlLCfMKVodF9ze5k0Y4Ss6s8G2kcIOpvN5E23RHRQ5VAObRRc9ssDWc9OqJ/V4np+gzRVbYT0S+RdE8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285228; c=relaxed/simple;
	bh=xNyDpAmR5FGwhysiQJeqiOkY4NC2Si7kbY4uEVulYIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvkI5P8kUbH5zxEKiYfCLmL4d+DmTAFf7rgLkui0sX4xpgogfd2yt78B6oIxG6/P+v1B0VxeDddsEhg0NwS6p/hcUNeQGG5cneOiMR2cxNl7YTHEdUtn7Afo3CyoUzJ2mjEg4a/cjwOhEgGiL7Jwm62Moai8R9rCdO8ZW5kezUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7zt8yU/; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7zt8yU/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so6484165e9.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 04:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285226; cv=none;
        d=google.com; s=arc-20260327;
        b=nvAiZH/XKPDaLCRqdxKi2xMRgqQ9gY78+PEFf50+CbDqAnx/z2zGwAlv49cwpvr0cv
         VgBmIGCCu04RGP1pkyZ2gmpMGe8Jrw+Nv6N1QYkq7YZnzRbQvIgk9smgw6RmcxCPLGtb
         biFIKmbB6nosNtX9QyFBlMEc9pFXyS3uNBRcLKw57BLD4qEtCHXRMqzvEOAC7cRjuYqx
         82Bu6WytDlL3JSwAGALjPT7mLn+KLVRQLWonRiTVMIwfRaiGox8LFhE8/bbmqZduxCJU
         1CoVyGanqMk/0cjS9Cm88bTmNQzvK0ZRKYnBL5zsx3Kdo+6jhO8rgsb+R4z2eu/VWzpR
         rtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        fh=YXDPJbgUdpac1PE9B5TQVhTRpxXxzuCaQd38xCE8M3g=;
        b=cfWQS2kSs0qB5Je28Xz6IBT66pY/ywQF2bpk+e0hG6/PczBxf0GnxyQipwxaTtCYlO
         cZORdm8kXe7ew84rwtQPEGCIDAALXfmL0UIe9mt+RgSCi/+xBcdNDfMB6y4bMPadolpg
         rVz5Xu6x080cTw/fwMacUxDVyiHsI/CJEcDqEQUcOT3yPAPtdSqw9T2jfQ/R9LiVQasG
         tJq6fZJ70E8LIbcWAUN1JYZmkeKf5zZgzJmq97WJ1JR8mFrE51b8Mq9wQ1T6dO//MPtE
         /O73JLWl+h9EzY8qx/R88FGx0gocAAnyGl18NGM7Bj7+lWsH7AFZmH0iqbvYxR1Nd3q1
         657g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285226; x=1791890026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=C7zt8yU/Dr1uFq1oZpQuvKwQ9NBTNzA9jmFC9W5KhcHZjxApR03UeFJQDcJol09SB6
         i2K1HPpx8WiE3BQAFAGDjF2W0ufyBde+7+U3sSph68j9G5ij2rjdzoH7Vcmvqy0QvaZz
         ChlTJX7qEcBz2ZyDFALRphl3dyP1oO8vrmj0THdEf1najn/BWO/yuVxm8fC9Wxif1sLv
         Ki/7hqc7L3E6UgWFhExjz6p6vcyV7WpmmJtyDc8dINMwdjvgrvehodyAFeekWCVncNNI
         Uvrcq9UlCzb9toTkpTqoVs+picWgzybrR3/FektgdyFDuf44n7VAmRj4NXqzHip70qmr
         KzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285226; x=1791890026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=LBkH7gVsMbam3b4tBqj76H/JXjbh09jaF0l7rWJBM/B6QD/Xi9IDkk4ks1y8ySSUDc
         0JCBbsIHsQc5+WndVAfXSrDPyfe0rpLOHA7EnH8/a1GrYodiWnypxoxuCBuJATIDwCrD
         xqWzxPkz1/CQ7ITvnoccAPooz7o9BIidFxVeBZXJGIXD66KH5UfWXdt8SEdGEqTTq3Be
         9jqk6HHeWlSBuL1g/gS0hwL221bZruV0OTMkP8i2FvVN0DmO2o1hKQ31nrqQwgLbh8AP
         8K+asGmRgCJMb0+5Z/iFaee11OE8WQXFHcDPCdeLrikfyHe1hP/rPst76/jO9AAutC/B
         SoNw==
X-Forwarded-Encrypted: i=1; AKwUvBy8UWYFcQBmLyB8jDkfXl1PlO0UHvKrj4wrMLH2gGn7g+yiKZcl18e50mUCjgwiAIHA/5YttrY8lWNyEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mWJox+mX426QOAgrLCB50R+Gr3qrIHZ0qco1Elj638A+P3agzp
	T58pePUJH4WWPJYOi9hzQV4lv3XdyEWSHpFfJIpF1vxsbI4D79HEPyJBXOOcnSaQbh4iIXw+Qv+
	P4vRXFU/k4+zRM75cSLp9T+ORzyehP4o=
X-Gm-Gg: AYBFou3hcGV2kC4gKu49/a8/ovhaOnpENoyNIVG6s+EDfGXiWPiJ1M2BNUDzu9xhQwD
	3mzzFp4BnY91A6CrE3wYVHCF0kt4VfQhD6ne9qnChw6VzsbQr2nNqqIHKFY0hxbMk5sg9gbhi34
	5eLW5wB2u5Dxa5NLFspQXm1tpi3QsxNc3w3Bpu9ejZ/AlGuUB+E1jwgy7yWOv/kOcKVXae/utYJ
	WTKzlaKS+pgrZPchcsFEBHK696e0/CEnlVd3sMJOrJL65uQmI1cDOWaaDwbmiByUzXaq8AF/VSu
	XrAzX+QWYovWZ+4YSe7t2tU2bTqKLRZ5Y40qDBwYYiKLuzout0Co/wG4PJwBjuaTIn+hxstBSKX
	I2BEzgx+aZQUs7dyamFI4hu58qZ9vOW2ghEOGD0eYOkB8zFIB5q8yQ2IGDWsDmGAeB84shERe
X-Received: by 2002:a05:600c:3510:b0:49f:ffdc:939d with SMTP id
 5b1f17b1804b1-4a17b536662mr17476405e9.9.1791285225506; Tue, 06 Oct 2026
 04:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:13:18 +0100
X-Gm-Features: AclHuK9BPf3cilBqj7nThWhC8BNihFPb8g0An5CConkIqmbm3l2wQk6-UbbqXpI
Message-ID: <CA+V-a8sJgTEFB77V=UUXf2d=GLfbEvCbmk8ueGWPsPipr8Dj_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:54=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Some Mali-C55 integrations place the ISP in a power domain. In
> particular, RZ/V2H uses the CPG domain to manage its module clocks
> through runtime PM.
>
> Allow a single power domain and describe it in the example. Keep the
> property optional for integrations that do not expose a power domain.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index 8fcc46660b75..3a11d3f8488a 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -36,6 +36,9 @@ properties:
>        - const: aclk
>        - const: hclk
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      items:
>        - description: vclk domain reset
> @@ -77,6 +80,7 @@ examples:
>        reg =3D <0x400000 0x200000>;
>        clocks =3D <&clk 0>, <&clk 1>, <&clk 2>;
>        clock-names =3D "vclk", "aclk", "hclk";
> +      power-domains =3D <&power>;
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
>        /* Example interrupt numbers. */
>
> --
> 2.55.0
>
>
