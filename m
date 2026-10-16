Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6B6317166
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137040; cv=pass; b=QM65BbOvqaSTceqGbbVkrSFDG1fK2jd6RL5laS27TT4Q7lKJ4OFQthRPm/MHUtEyMeNSZqe6h6+LwRegG7lJWpfmpJKyZrIQ7AjhGKMv+tDnZ6GGF84vo+ns9OywoIHvlMioL5nVk50EDETcXUbzt5O1ja6wOfgq7iBspjizbnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137040; c=relaxed/simple;
	bh=HdaXDt7roetlcl5Z7zLdM7ZLqhcMX9rkrRQiOIl8xO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxdgzCP5yrbtkZeJCzEPGlKnoJiS20RaTxDSf0apRlnXAmmDWb4yYa7G1/N3WBQ5TxDGmtesKJ3mchx1ciJU1y+3+fmvjO+5PSaojjq/dbQOR9fMcruYbk7r89g6It2qm4NJQ8Q2H85XliA/U36K1WC7dmt5Xd2v+xX/UxGDXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqx0GIUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8ioKYXP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqx0GIUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8ioKYXP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4497S3875083
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=; b=bqx0GIULVEZ0BXv1
	od54Q8iEOTBmD3qGKcv+wqjM/h9tX+TNbRdLnyAafGBPN17aJtZpM76ETsMAwGtI
	OL7vWqbx3UFGLeeBxNyVo06XsH/OViVlUVpOciNF4pF8aB3fJT/WI2CregIoli6m
	DbBQEUA36k5tcgudCf7tkh+McX1s19USm/p570neMhabLO7GYSVGOqaSI/LNhfyS
	A78pZiRih1DjTGVM/KWd8bIBn7OSpGeRXzjF0vc2g5Kdze1vOJ8mBUi1mCXPK5Ek
	G+VbQYVPZcrrBQ0YRbnrAmekABBPJpQ+4QoxuZYM+ZJQpE0pZlJqeW2iNsdZUycT
	gsJBbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt8s24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:50:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1178996085a.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 00:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137036; cv=none;
        d=google.com; s=arc-20260327;
        b=U+5xV8Es7PkthzPRJDd3uR8FIO0poZtKQ+kIffwCz9MXBOnY+IWq7uwCuOAro9PzTX
         5AlmlByUgmIqCRRNOL0gafxlFVcxlPkcbIXgfHRgRBYGIGZzouDCQjq/IbfTqvENauaZ
         1b0P+byJqpdsd4EKP2zSTg9L6tY1mdjuLgij0VhSJ9nrzfn2Kfsyedk4MwuuaXPyEXE6
         ugVq7JJ2nzIWrVBZldv7+OqQlnq5FiFSsfukHDr0WQPy0ph7d6ifSEY3BQrExM+K9cdc
         QNy7MGxsBbSSoQowWFRKlOEs8aU15t6dYsh4kOCQgGxdU966TLL0gGD1LYmtALZXEdkZ
         918g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        fh=ERggL2BwJtOEkKrFmGAVoEy1VvnXSBduiusK5QyGeTY=;
        b=OUbXlOrh61uPpLEuh9IKXBEIEegGQkaEKw/vYBUSR/s0qBumBvHABh8FKcKd1fxpbW
         4KdUnHg/V/rBjFn7259BgImGFtX+MB8+cMZM/XPc4wzz9Ltad3M1Du9gr8shw9yUfMGY
         7vpnRl/ijW4hr5v3vFluLrP74vaXSW6AYUIfGCM1xBseL/34ROHC5HvEVpxdLuNcIk8S
         PO0w0WQGkp+4tUZnWvnCZ/xGy1yOJaWA2fuZoHufezei65TIv6vJZ1u0z28D3KbViicD
         ea1nAZvYmJQGl0FNUuqmS8LzfHPN8t7v+tDvz3XqKsgSg5zigo90fbpDExOZixyoER4j
         iw4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137036; x=1792741836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=F8ioKYXPwXD0vyF8crg7z04qpvNs3BO3ANwEOZrHSQPRTsaYs8eIQVwOJDs5giZZeU
         36u/wJo8y0UIofXsgHvNd2jWX22W6nr1HfCp5VD1zOKnGHPAc/2Gz7HIiOeqM9LVFt4c
         d96HrPhdA1fbKgEJyCnRLYHofCFy+TXzQxz0PtvxIER/O3zLxqcMnyJzuYpw+6ABYimT
         a2d+zOT2tqnDbU86w9L8XppiiljC+b+u5gFVnkQoMSl4M6FvfiM830rwvPCZL5HNGhME
         XlqT1bhGtGjDyHEvu9ufqPqNIqpus0WO3UNQNGLCZm1b3TQNV6JxZsEdWBCPT0bDACmP
         RBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137036; x=1792741836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=H7l0bdNxvUnpXFRlqbKRhQ2L8bhmSeNMfQsfpWEUb4ttz8ieuhPSaZxXdSDCsFh4dY
         Xdm5td2ZwNM9vY6DsbWPxwxasf060Lgy+TFo4MGXP+dQd1ueTRD/ZwD4BrvilvLZ8zfB
         IVSrqoK1DucuxLQOJbwreoFY/pRy8svpBUi7vsyFTJRa2fTD6dd/F/HtY3F1GL8sCvrE
         ziwlsjxHs6UiJZUkZPctLdawyvUzvNfamHHjhRntH7XpKN9XU7tp1oiB0z647e9iHF3V
         laZU35Q6P/55d0XptbSbXl3mPY7o4rP59X0QLGVCC9EW2JVxYZrC6VgxhRMGqamdch7s
         +1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwC3lL9Ti5qKD6bKCytHREfJhhayS+gCOcIUDN3iVVQK0JSO1YG2Hhfza4vGUjg2KphdadbQKtH9Go/bw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK73PNxEWNgsFXgyHlKe1ywzrTn9OzrZmaDZ89DFeOQ6jZbm1SR
	+LcN+Z1OBWq+N1M+vhsZsUPBlMDbJvGgRxAweGw/2kveMi5DG8XXYfVLa3y/PU1e9Qqa8WHhUKm
	X/Mkx/n2G670I+vHaxMLqnUfNgIedxhhZw9/lEnpIbMGdq15EYDuBNK0bfpI3g9sS2SeR+Pvnoz
	cH1lD+ofQHIvtpGO4wI8CkAKG8BR1p6kkZjH7HL+7m
X-Gm-Gg: AYBFou0vbFY6lWPmbWK94JDw8lpKtIq27Ot9C+NKLESl/paaq9BDnCKgKqVBJ1Ft+GI
	ut+F8E8BboW69s1NqkJYpRok13sdzcrbfeSVBRE1NPJBMa+xxPOax23jhqTBPyDPwinQBB7J1IC
	EZUoqDIS1TbNNJtzBSH/u5AwPrHjv+b2zgTFq+AHNOdGuQqNUWcThFzWlXRW0/OaED4dzg4XHhH
	vNp775TEA9hTIjP0eOk71uWe7gWAjejRIUoR9o9VUI9b416iKhVlj2tq5GdU2lXzSOAAchWnXx3
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id af79cd13be357-93ebd25d1demr3398992385a.57.1792137036377;
        Fri, 16 Oct 2026 00:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id
 af79cd13be357-93ebd25d1demr3398990185a.57.1792137035856; Fri, 16 Oct 2026
 00:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:50:24 +0200
X-Gm-Features: AclHuK8JKCvyx1h6mjiUhNqE7WWuH5Nj8DI463hKl1Pcfxn_BS7ehKW2f4RxCvc
Message-ID: <CAFEp6-17SySt2t5HGYGeQ0RRf6DPQDz08JjsAJicaj2R1KDD_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the receiver
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXw0osW2MEgtjC
 bzGHXW+oyEl0pMR2UjIAUS1hX359VsWTc51Y+D2Vr4RpxOTALDkTwIlI/IvhVkyZNPm7tk++WwK
 L59E0jyYYiaDHu60BoWEBGhlHvzGLY+5a7y9oACLQXUyGDBYah3YSkmhYjuTGNr1MjOv1L5fgx1
 lrxDSCVDm7y5fKVbiFaO8iLqllP4abVx/IlBxqYOmErf7rbip8QETlt4OP5OCLmVNyz+9KGjWwL
 AKgN6mGVvtlgnlGiN7pTGEdvFNbZ6hx8G1BszPMIRHhmDiFFZaaggqmc51NYWgoAbseFawpdfL+
 dUh4r4cwGTRkyfg1shIVRaDwom4LUKz74A86iGfKU5xOsHcevAHzRSFlidLKqqm8T3//dkRo8p3
 NLKlxSjzTed+sWvuGJ1TDvHFmx7mf51pH+6obf0PVxv4Fdp7d+N6lWmWyyGsUVvPdZqlcJYw2dB
 yAWtBOn2M/DsKnrBAbg==
X-Proofpoint-ORIG-GUID: XrcBIVgLUBV_4rHf2v3AAGN73fVI-7pE
X-Proofpoint-GUID: XrcBIVgLUBV_4rHf2v3AAGN73fVI-7pE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX2iqpMo7idmZ5
 HpSJAxJ5CsEsC3M7gDaylVHx6I1JPgrnUMPHbt0ABpjGXqGRSQV9NQyLOBtM2ujt/kG5xHCMMBZ
 Ahv0UdXpDVA/Kdxo64ZG/g/Io8hDixE=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1d74d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> CSID 680 has a PHY type select in CSI2_RX_CFG0, next to the PHY number.
> The field is defined but never written, so the receiver always decodes
> D-PHY. Write phy_sel to it, as csid-gen2 does for C-PHY.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

It would be even better with proper masking/FIELD_PREP.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8f..16b199f06 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -202,6 +202,8 @@ static void __csid_configure_rx(struct csid_device *c=
sid,
>                         << CSI2_RX_CFG0_PHY_NUM_SEL;
>         }
>
> +       val |=3D phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
> +
>         writel(val, csid->base + CSID_CSI2_RX_CFG0);
>
>         val =3D CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>
> --
> 2.53.0
>
>
