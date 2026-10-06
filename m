Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F63E44E4
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285112; cv=pass; b=rJw0H/+SXsaJGdKxPTZlOHG9jAOt1y8vUjHDvkjA+WVns14Ht7jyFnTYiPIrOoefQ5M1UvzTBPporfi1SghGV8QKYt81mSoaDOu6na3/+Sq4LxLuTGPiPzHIT7TxfaiK18r77F/e5iWbTfWbVZYFRWiAlsEZytOaSgwmi9l1+Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285112; c=relaxed/simple;
	bh=mUNeY0u+Irh6yo+HzKbKNtxDudPGVOMhORN9dinV7FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C17euEaGQyHv2L4Nn9WOcNdDVwx5X3OdcqoP9Q/amzyD+gjcoLwoOvXc1zwRCYVbP0GrC5I4hrs+t+Qvo+AoaZMK/N3ahGVKZFgTJgWoo65uuoTpMTaG872ThDJ3yPU0KsfOZ8OtvSYafe3ML/eX9o8q9XLzID3oYHQZM6YFHRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc82NDTs; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc82NDTs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2268882f8f.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 04:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285109; cv=none;
        d=google.com; s=arc-20260327;
        b=dyunr80dSD/dvi29kC1pn/IiAqEm+kwplCT9ntlYDE7F14N9x1UTDu0l5Ac4nKXqqa
         UUp7ppNy04vA8h10mnolvsp4u9OB9wW78xEyOP60n4YaH/YiADeLvSFkPyNeY7gC/b3e
         9BYoYmbMg7JCIQw/61463HR7vskhHCs9rpP/FOPA9H+kqvLW8kyWGNc5lqMheWcMmnXO
         Xw9y6Aop2YzOtmz/aZT9jYbFBs1m/PsXfqatTs6OjlJaYkjWs9qzDEqJMrE957LkY1EP
         Isa7KTTAw4Il7cXJGrKZMDCFW4V2TZCjdntSa6e2aDCzb/VbONOd1QbB9NFZSCK0uwts
         dXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        fh=Bb0sqy/Znm1NeP4Kbmu/sTY52xlM4wMw9AmYZ96BBVw=;
        b=LSrofeR2XHfzDckk+j4KxlBS2qJyr/HyM5hSoYxX4KW0+wfoGrOUksZyXzQGgqBD6G
         0QhCopn2bHAMdggTUEYp4+tlQhAG7H55q2snr+39knILRztMm9ocwMSr7pY9eBBE7Zkm
         GWbOWZulLaTg1DoKgyNly2UF6YzKUmXY+5+MLhhazx1cdb2q6nV7nbEesdBm5D64rK16
         vT5ApBzj7aABXu5oNQon0+GNBVxp7Y1/4l3EpTwOxeLtWp+kBAo5XXt9XAmkej7PzRPE
         edjVsCk5R7Hha+Py5/5DG8lB/B3nGXzrJact4TjPW3Si8EVJIIHMxc687ZKrtEynTsbO
         UcfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285109; x=1791889909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=Zc82NDTsUNurJDINr8R7WoGBO1Kglvdz4OFjt+dUjGIdn813cYGuiuG00CFAGsjqoh
         wSwv3mSWym9yl24y6vzSfdyHXzr1NKe7CIqqY5FADf2b1v6rYmSdZ7tyd2k5vFTdncKA
         +eWTJAkb8wZyBBrExkd5ITvtFfr4MyuFhQNNqaMUABl/ab+TfU/AbWmu3MCMXYVSuz/2
         fGDbH5FGMDXARijapoefRsbIb7XRQeA/sZ2Mvbme7MVpc/E59tSlsyl76gFdYP0bmpaa
         pYTKTkKhAOY22HC4Ps/fDPLer7YfP2NeNKUaKpiSSGvjHRUqJAkIDvNn4Kav7aPOsTDH
         xcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285109; x=1791889909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=pkUylMjwgJa4m7qBDICNhnX8pbOVtJVNwwb8bWmQ6cE9FiKKXOKwh78TWZwcqpzWhj
         GUYfPypCdhjfLNaFIV+lDOm2Ti/POeEwB6kGuF83nJEqdpdnPu+/9X64GFyFzyYeBRWL
         ZGr9DcmWi/RMayZHquKlWTa8bU1L82cNstIffALwWAwir7njW7vLvqERAGmgVEE2W6IB
         ajKfctd7k6OZzi7QmQldhZ9qpzdnUJgXDb+5VYt9tSZL+JXq+7G3u03PQb7jg12VlqHb
         Crmv6N3q8DxQWzs+8OY1koNXVhebVFNJ6/5GfMHCVrf9+oYDrS9VrLFFSjl9dI6QohAO
         KZMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzM+glgywOS8XNdnXplQSDFH9s0rOCzb14MMuQepMsc2Utv+sZLj4TqC1gLWpyKMQr1luRiNZuu+43uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2xLMFt5C+ZKWQhNo8zEhOlMA34HuimPJojahwuglo54Khh7tq
	CEDkWYROoIoZdV0qZfyKW6ti2tDBf3mMo4qnuzZO9M3+xbaI/wV6HnAq80kVqKTklmh2Mc6ypO3
	evLadbh+7Nu+q4GwOxtFS3zBc5Y3SUDo=
X-Gm-Gg: AYBFou1GgJVqaZHvyeRsqqupr4TJAg/Kx2bJgwmpKccDffA7aWXTEu6QnUpBf+bfH80
	j8v6m+vhFz0au1a9SLSiDL89hCD4rO/53w52esGV0fodhmCN70owfsaiBNc1vXMxl0sDQ8Pg4gk
	ri58cGkkPOLVchNiKMgTyZKiBnEv2FZZd4zwunMF0TFfYqV8lEdfZucqWmBkS718UtpS2tbTQRU
	EC+V0v9lXH++jWT1nhI+V5Uc30DZ6wY13oyujJW84b2MfAr2nOMCzbQ2JXuRfwKO28c3wOo8gdD
	d6/ymDPkqWH7stWsrIJ7LDiPD15GmkfTEGd2x3g3/eo7+hlAD0T8VVh4J7Qctv1Mj1ayHycHGoR
	byrJExe4BP2soa9qmUrLWssRK3vMF3ue7OATS7IXU6SHskqVFNSnQGFyR52GP/fUi2Ae3kRuMci
	Q7D7jwxJU=
X-Received: by 2002:a05:6000:4a04:b0:48c:4707:1b6f with SMTP id
 ffacd0b85a97d-48c480272dcmr16516413f8f.53.1791285108694; Tue, 06 Oct 2026
 04:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:11:21 +0100
X-Gm-Features: AclHuK8IOd_scDCDMasik1_SzcAsKOlMt2yLWcF2qQVhREPX9v8HScGEMDKtzlU
Message-ID: <CA+V-a8t5NaVRnh60eTD50rbnHGmYpZ_O-bQJtwF9=yU2jo_5jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:42=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
> interrupts in addition to its combined core interrupt.
>
> Describe these optional interrupts, keeping the core interrupt first and
> requiring only that entry to preserve support for existing device trees.
> Extend the example to show all three interrupts using mock interrupt
> numbers.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++=
--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index fc4fcd19922a..8fcc46660b75 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -18,7 +18,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined ISP core interrupt
> +      - description: Full-resolution DMA writer line-tick interrupt
> +      - description: Full-resolution UV DMA writer line-tick interrupt
>
>    clocks:
>      items:
> @@ -75,7 +79,10 @@ examples:
>        clock-names =3D "vclk", "aclk", "hclk";
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>
Same comment as patch 1/4.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          isp_in: endpoint {
>
> --
> 2.55.0
>
>
