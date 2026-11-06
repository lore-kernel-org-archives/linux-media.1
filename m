Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962310;
	b=mmSIJxxBYCn1wPlkvY9j7pyfUyvBm0Y0JNrkzL2o7McUSQuwO21o0V+ryK6SZ/Z21gHU
	 6+i0zx3y4S00e1EuvOEz1RXXMOKoOOVaLO7niS1LINshy396+RdkTSbL3uAxEJOeQCtTg
	 wBMOZPqG8GtQTuEBfsGKnyMzy0q73rrs3+nCoXjDV4P6Cb70E7bUvuVLW4YhjG7F/ya0s
	 QZxFc5WbHaxKMyvgrrqvuuoJ+El00nr3rx/AE/J+MWVnfc8BMx9DRpY8I8uqZCGTEO9hk
	 3QslIXx1TxxrMFqk2UHENuoCS1TyVeJ9mZ2HyF+XftIRHvciuwBCwlQeVwCELeBXvlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
	b=5LWq2JwMYtW+2ayiHrlGhbmZK3dAXt8uiLrdQUA74uWMbaE9DfZumHI6lgPIUzmyl8lC
	 XJkZ7pAHlOmaHhr7P+t8vOki3IbiddnFc+3H+psJ0dnFvLK/uUfJzB6woNGSa5MyNFVMR
	 WeSKqmFyNmkuxTWf9BdMX+T4uQSfUXSLeJJPCEdM+GSBz3zJppJizqjfc4n6duSN53Y/+
	 Vul3ljR6XUF5LtREy1Vv9MlJje4/giwYJQK1VAdQFr5Qki1kNRJsfO4pGEVLOVk9Coj9p
	 nbgt9kcHADjwokDa6FocMdgqg7LSVk7uBbQtOIcwk+Njv/P0Ll4dDhiPa+4Iz/pcf/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F4606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9F4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCrz4N2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so4349465e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 02:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962308; cv=none;
        d=google.com; s=arc-20260327;
        b=T05ULRWcu/5DYJscOk070Wc1s+P8uK1/Hn3Aw0q8nQ0TK0GAYBwa0YZN+JHfQuAxvq
         xgeH/wuFGhaImdqIkgPjWTy/9AYKo/w/oMGan9YyLQrukuhB2C+JzKSaeKeKliWk6h+F
         coGaZfAd2j2yfE6de7wxFuLIg8BlVG2FfwG8k1i224frZ7lMa3/Qs+dMHqvAA4MZRWhT
         nIXa9XTQzyxMFViAosJYTeUICOTKLZSm6bcxPwJF/Ko7oqS50NKuVJ++8EXON+euIij0
         YnaBpROb9+6a9rbvBjEEmUeVZHqNUUjGeQLmTleO2eW0SK9U6VXanYn/uJ6QSZ+Up22n
         d3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        fh=vuq8DzShjFy7x1LKeI0/Ew6r2vx9+gMPLjh6tqD0xfA=;
        b=ZHzESOYgvvFaln3w6lXZ7Dy6rQ0lEIFDI6MjFcoKDMc5ly7QizM4GyrlEI4gz99k58
         CvXzMSe7RCusDbozNNov6O3f3OmBABfjsf9JM2GDHsOUODn8TsA1yXTp/fDN5YvfU9ti
         FfsXDgTme2SS1v13D/9N7QrjoMjXU/VUap8am65e+q9KZBF27aTq1RSCbnnFEdHabI6f
         yP1YsTI6q5H0im75nfGXyW8hdOEBodQ+K3h47wPScy6Z0kfD6LWsYpkbpCHFizwZZrE5
         Lx5PswVa64HXwbi73+GquSZnJGBATc+pytdstMDDPvp2cjL+vYZbmC9BUiYizPnloxLa
         z1qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962308; x=1794567108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=NJCrz4N2jhgRr6RUniKh7Aoz452iMWE20KsKuojzX34ruoxn3t3gclq/ivC9Hl+fkr
         Lf9e64JQBT0tdJwr3MM+yRSdgfMAvUeDnEISoHczEtjBe2focESdMfk6xo+8esrH2fS2
         +KvZG4fNk3Opof4DTZ16HIdPPEme7lKjikMSz7fhg5S0OpCvTDCPaPfCvykDBLotm9Dq
         XW6Y9ovX7U4pvygphjLTKoskUbYgdrhHyr8T9PYOP5RwkSzOp7dSuAqWgZ0r25jaHaPO
         9QxT3YR8DEo6376PsXCoVPNAg4lmmXghV464GjrFmQ65tL8Zx1RZrBjo52IZ5UuxV/LR
         p/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962308; x=1794567108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MluEivsf91TYw2r3OQP4EHau8Z9PM71ojSNq7ZMtRTw=;
        b=glltMgYpQVaeJSeRrYLW+o+mBU/f6RSimvtqxWavy7oabyLebFYqpdZaNCwYiJ/7mV
         4IMuiwDvCSD6QKAftXLScfVOqMNPrj8230uRWIH14JmlQb6FGd4L6ocG9ypDjZNPSTfB
         Tihi+uxGsHD1sb/58hZ1FcXcnq6zkS8D2hGp0/BIeVXjfs/qJq44WoL8RIePWoKRECm7
         teox7lIE/VyUQ3PzTJTlTgRW6sSdKmhA8symHczyxPQKrkpnoWTADIl5YekbEM7T6fMI
         dSHG73y+3tuI2BLontfggBmVdkQb75P9e86N5KDzCcjeffzvZFWRfaMqGE7Xqr3e1BoG
         m1ag==
X-Forwarded-Encrypted: i=1; AKwUvBxC3cvTA79bSIy0umPiT1p0GMufRHnsKJABnlzRPpVa1t3EP7J47/StW1OYh9ELZjiDwANRRb1mp4u3qQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/LeeC9uTChcSegrODowM6perR5MVN9QM2tV8SzrWVKix3oorD
	KaPXFHSAjK1rpc2EhED89fVNIpu34P0KW8y5zt1UufdWRz6kQNd2I4wX/lMJzAJjRfMuong/1UW
	XEqSeXuX+R4XaP+pF+fGcqWE+UG8N34U=
X-Gm-Gg: AYBFou1ywAn8ZurKZpd3d59X8MTREhKGsl7bXwmHgEm/dWmAcw0U+8sT4c75Qt5OC3V
	OhRzmdXOMxXTdfuJMSxrD2UOuQ7of+1kq4sZczmZU3/dHXMREkd2xLmD5DMe8UlmlT3O8+yKJJc
	np6yukh2YPw82ohA+oVBpc8XlrpqWlA08PXtr1hO0lnmfcErVtds4Pn3z/L4+iL+bjpdCdepZpL
	0+kZEFFOa7Ypkiyezbx2bcLK57yPbCLBo9Mv8K3iuBAyS8G/o6KCdtV7KR23d7RoZRFodULw0uO
	p4NHlA8pjNcCA1Q6qr7tdnF0uUNAHKF6ZZMbtXim5oN58Dew3jQDz78dy3I3sc/nkl+AVtXK33b
	fiOybB4l0TS0xHSG5IXCmHI8V3dW2Ljw3J0S58hsBqK7RLcLTX/XxhjB0Q2stZPY7hG3avGJbd7
	843El8wzsaBU8H8lIPZn1Q0EuIWtvZ2asWH0ZqdbSbjNCPaTW273ZuE9GJRQ==
X-Received: by 2002:a05:600c:8b23:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4b6dea6984emr35455975e9.9.1793962307992; Fri, 06 Nov 2026
 02:51:47 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:21 +0000
X-Gm-Features: AclHuK-lci7FM0aGPKnhIKbKDIhrZWyf9SZlLziUPBVQ7lIewQrF1BBqVXI7RG8
Message-ID: <CA+V-a8vAKqJJmMw+FGrCyDPEh2jpOuwVJbJX=FyVzKkq=B9eZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:18=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 0926ab891fa5..0b3106b45074 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.56.0
>
>
