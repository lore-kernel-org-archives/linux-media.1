Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962279;
	b=sm+eO4tOJnE/rZZp3BJJKTzPl+sEWoGM5DHcs/67G18JD0ZLg553meaYyCegyim0WGXB
	 sKQnvqaQfiU9fTcg1nueOfZsWrJXapQc8Q4FHgYNLxL9KFxyW14wyETdRBZt/7qrpoEUZ
	 slorb+GiD7WZeytIkYp57GITBlPy8RtuzVtOdFGGQBeaBJPc2B4/ZS1GD2rldl2V05Fdf
	 MG/PY6d0QfV90UY8gvKDIihmqjqYIfID2HMepULhkcgpJaJWu+7tZtlovjrmzpevoV4Ej
	 Yzml+UJdZFeXLHAAU9OLUta7jiErYqzmx6VG5tdisig8cTFCP8AxgbvcIUXG9IWlvYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
	b=qtVPMAF+KZQNeBGWMgYzVOnFgyXr0M5kEMVqNZNly1dDF0+W8eGLThdYZUZFXGXQ256Z
	 f7JZ/KmC01S1buhfNiQSO2ev/LEJTb5R+elkW522KDkRe3cAvfdL76HraCFPIq2TTdhB7
	 yBrQl8BEOAws6Q0enKgu+D3p4EnurHKzjDfD3B9zMmJmqmB5rUgHa7cjorUk7OoBUboKw
	 9cAeZ/cUuhSG/A+1d8SxeT6h75oZ85JN0UswFUTYAn6kZ6fGXCUnchP+1qrH9k4cPr9xz
	 lMGCfKnoP3a87nTd1uDnii8/IDmV/ivaG1fmdn0W3OACuC2p3Gx10GPcrETD5L7t9AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD7606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 10:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAD7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so248963f8f.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 02:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962277; cv=none;
        d=google.com; s=arc-20260327;
        b=BvrWanv374soWGg3qMUJaceRA/HdPQ5fB7mNfOeO28XxBun/4t/Ev1I9n4E/wePXr2
         Oz0pjhYgr/RQYkJFNEPuDiB2hgLQx8v+AKWzWRtc3bvX8cFLRVjISWpaBVLVhIZVIAPj
         JcuYnUjnJKXuOVJjWQbJ0rS9YEBjYz/AASXzcmet1JxO53yiUsLpDmnxamuqa0PMrSLs
         RvFSS+u4hlEpPVlFAEmOujzkedRTlZe8Z29KZAXxZZsCQ+leXtFn1/1gk2gztj/F4qDD
         QlKhx49Feo4gxpnE6zqNM13EtHESZ2L8U/TXlny1UQLA23IQZDRqG5TnShZY1BNCGo76
         o0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        fh=/2bAwXSoDrSElunbHkbEZEWWO9PQk1CeYEiOQbmUak4=;
        b=STluL5No+yjZcmIdQ+xLep87CesLY8Yr/IWpj5sDrMRe76F1QhZr/5qixmEr6MYa/A
         jQomd7MoigQFR2kIZRCn53l9Rg+YZ+PWTt+utSSwbNZ6y+3/St9l8GtFeAt2cQXnZ8pX
         wPjGy/wF8Fwr2Sc+cRvX8Z2ovheMrNejKipNBwErH18dbWDKBb+2KIrA/kaX3QcDCdP6
         kOuX2EiCdSxas7ABENT4+LEU1RC1Z4N2YWvx7pNnyiSKq+6yjFNnM89RqpS0/BNmG66G
         +MDd7jvlmgiU1qJapZ7hmUiKYhQT1LNo6YiwNuHPv7nicC7velAacLRSbo7+C0jDwI7u
         hIOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962277; x=1794567077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=qavf9uQhhEstBSLlU5BG5brVMdHumR/aLgNXeFGpb5Jl771lB8oKGm/ZFzl/OJMN/T
         Pj9PB5hRDpNq8Gb6Piw2Nw1MB7y0lwEzM/dF8BZdXzUaONxb3aCxzyue/+c81NEcrcmZ
         jGMStvejbbmV7RBw8w6FDvMsB02ACYw2dM7zqBTZNMWR9tqm/lVkZl8ARqdT3GKrEA9A
         gLYn/qBUwBBGeJ0MH85YGu6UnEzAZRblQlpZxDDhaGboJV7jpboX+w0oc61TKSPl0511
         Ff+Lo2LyfE85TXniLxLMT5zDkPfTYzKnGjHLygB8R+9lLJJyx0MUQMfzBEG97vyD5QFP
         dzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962277; x=1794567077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=HayC+RhSN5EsVk/esS/rm982acSmNQ7k4PgeluW0HZUUTYqeifXk+IEjK6crOZvk6g
         XqD7P0RGhl4wgOCzhZ+DjaglHa2LKdiEvOPeToovSFOurN1eUbKr6P/rJdeD+NZTDHN7
         HFmVIOQaxOIFlAWxvE6pSYaGUsaBqT9MkDJKpCKWnCpV4zfnvy153q9jPk3UFpLB2zjt
         larJa9irG0yvC2hGQXpAZHowXuI3Ot7FIWrSgTWTJx87W0ZT5MMStcoOhKCAahs+w1dn
         I+Qc4HwjjwJ69Lmqs834zeXi7TlsLUq6Vy0njzMXcahzyC103wRHDe1hP8gFI3VrTlgg
         kgsw==
X-Forwarded-Encrypted: i=1; AL+hErFjeHLhA+EkduCmtUI26U9RSoJW2OQA3lIKzNQY8EAvdeGWNFT3ESTtLDsL3zmI9YS6cpUdJ/2gvtQf3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ufgTcI5rpqACdaqW3EBxxwZfILRKARjVPu2RYvNZwwUT13Oqk
	K/sC764cbLwfqitSkabPlFZI/6BkvAWg/OJwasMY9J8QVuFpZ7o4CkwLhCevHBhzZ0UnTY71u2f
	QY0I3SaDrOtEL0x3MSp8PhP5Zu1v8VXQ=
X-Gm-Gg: AYBFou2Yel38tRWPxDgiAMKMDhN1Neq8LLyipGJ+JqfyKF0YOcJLUkna5VHGrFC8Y0/
	lWp3U/qEH13b8hXfLViR7XcO9jPTUFVzmbTyG3d//0jryl+vvH/Ilmh89t2oEDMrhT4yWap/Sn8
	pGw50Xk4RXWEFIrNTnQksxzBEE6knAHiAQMavM1RNaO7P5PYJXYKZZZYEfZ8Xl8nC2WP6hzGJ05
	BV40iCwCV76e1MTJp4Ev6PQX4vVIUb38QZBplFOVlOc6DbTGxdWLy+GAO45p6dFCS7dxlwAV0Df
	ru9yP/BcFz1Gv10PnG7s96WuiNAAMjlUXDGEgPDuqsy/LBQ3v7uLbk37zLxpD/K/bJftAFWNISs
	lmZipJwwkz7Bzl2u6edsyTrTBSmGI6AdWhvCvlO2W4GTq0z3cD43a1JEqoAUDahDbj325NxbwEE
	ZCQxqK3JCxUsGPirFAPiJJzQ==
X-Received: by 2002:adf:e84c:0:b0:48d:e5c9:39a4 with SMTP id
 ffacd0b85a97d-492775eef16mr3368306f8f.33.1793962277232; Fri, 06 Nov 2026
 02:51:17 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:50:51 +0000
X-Gm-Features: AclHuK8e9Ukwsf61t80TfL34Hr9SEzBPVRwsLBuotfmtVU3xNlxjqp0s36ik-9E
Message-ID: <CA+V-a8u8WS4Ut0f1ELWPciY1wvtWtBS7UwOSaDg-q5wVFt8bpg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:17=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1, place the nodes in address order, add the missing
>  interrupts in binding order and name them. - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index bbaab75681c2..10e3434d0997 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1849,6 +1849,53 @@ queue3 {
>                         };
>                 };
>
> +               ivc: isp-input@16040000 {
> +                       compatible =3D "renesas,r9a09g057-ivc";
> +                       reg =3D <0 0x16040000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe5>;
> +                       clock-names =3D "reg", "axi", "isp";
> +                       interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "isp_vvalid_ifp", "isp_vvalid=
_irp",
> +                                         "isp_int_fstop";
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
> +                       reset-names =3D "reg", "axi", "isp";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               ivc_out: endpoint {
> +                                       remote-endpoint =3D <&isp_in>;
> +                               };
> +                       };
> +               };
> +
> +               isp: isp@16080000 {
> +                       compatible =3D "arm,mali-c55";
> +                       reg =3D <0 0x16080000 0 0x80000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe2>;
> +                       clock-names =3D "vclk", "aclk", "hclk";
> +                       interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "combined_interrupt",
> +                                         "fr_dma_writer_linetick_out",
> +                                         "fr_uv_dma_writer_linetick_out"=
;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +                       reset-names =3D "vresetn", "aresetn", "hresetn";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               isp_in: endpoint {
> +                                       remote-endpoint =3D <&ivc_out>;
> +                               };
> +                       };
> +               };
> +
>                 dsi: dsi@16430000 {
>                         compatible =3D "renesas,r9a09g057-mipi-dsi";
>                         reg =3D <0 0x16430000 0 0x20000>;
>
> --
> 2.56.0
>
>
