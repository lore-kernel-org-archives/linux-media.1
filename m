Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427330;
	b=sqVsFtOC9+T+xJv+SZ3RBEESPGlHNpvIbJKsjU5mjQXI72KtTqW6k6Xv3BhOKlbcRcDp
	 2fH1sefgylXN8laY2Bj3nFE4pJXOtv+uCgdGZ0I11aYYHc41a3HRJVAi551WJz97RY/8d
	 HFRl6+jHrwriARBuCI8l1kfRtZ0P20/BmwhK0/dwXEksfo0CsM7mO9eV5Z1EZk60bG7nn
	 uW1G3AKNduZDUEljmiKgfbBJsoX7en8Ur2FcQqm8IJp4KD7r2DQI5uILWaN+IXGC4nIv0
	 BQyKWJVMwgz2A34Os+vTISLyFyjU5Q0NYFOpssp4WyeZt1DmXbFu/irNlYu0+zarxCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
	b=igTk35NEW4u/U1hq+GTgOskH9zYJGKCZfTmskRMY9KNCokcgjstxVNE23urUguNEXOLb
	 0Jc1zDAET7bpEp2/E/LchCKxKRnCQzoWN/ESsgU90SnY44s7OHf9MaoxPAydcTBPkucwG
	 pCT3MjjZnVy+9O8t/sfgeZJol4T4JZWeeayo/e0RZVaiAiRrWh9Vmrx5wO0c7lTQjXM1Q
	 qnOpdRzYZROCSh3U5EqQZ2PPjOv7I20P7+eekPLXD0lY5+mvSJEuQxnWNTzOBiCrPyYUE
	 sP5yBZXeh/GWf5xPPGtmdykNlDNZHXsNeMu3bRjOrHC6BB2uM+ZNbYgKmL8Y9+MfTnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh7pfmJo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jt3P/s5+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90671606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90671606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh7pfmJo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jt3P/s5+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G2kG2786330
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=; b=Dh7pfmJon2xOpRRY
	vHTpijLFN315/Zgm/NzwdAffjKE+xNzkTIQpinui/FQDJhDuIjgO03oxpWPr71xp
	9ixtOAFplQklbD39vx4b0M/b4+DjhJGkmmYfRqHF5jQj1sdAPQjd+0N/EjqBEjgh
	P+xrPQDrMJfKxLJb0bQzziU8BP42IyhO3aIfCWn1PROL1Lq0KRkoXP1nHYHBmuWc
	3cc2GHIhWBwj/A90G4Bsl0lidJtyckfxAd4OSmHm4ME9luR+HUj9bOqCmT2MT0IB
	dVresgt8XXRlRsFn8rH0OB1LJyOkDKbVRxGa/vkek2Tw64QQrde17lMdxop4wS15
	XXOXYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0sx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so572165185a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427328; cv=none;
        d=google.com; s=arc-20260327;
        b=bDW9bqC0udlVCwD4OQZgCppU88N6FNYZ/l/L2UL/YAd0B/nhyJ2tMdw93AwbXIXB0/
         oYh2g6Icw692qAUSrMO3LLycgCQWeS8xO43tHbO5t5mKKqcMLEvwbClly959Pw8VX93K
         8uSzjVLiWKM467seJvZBf580uBHXaL2mPUGGM3XikQHz87rnjh8H+5/tYI6qn4wUldxk
         hnglegefKkidhzJy1cW98z5MtGYDx+zCx51uMKHDo+96r0L48AjDzK6EVvXWB7uVOfzN
         zOAm4GBfhw4x+0Mag/57LeCHmBapi42ZHFqnhwX6+XXA/HixuI4tJDZRMyrallAUoj+X
         cbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        fh=ZSeUaLt5djeqOvjKUT5LDV9jRgJcr5mHKuQAE+8ymzA=;
        b=TrbcciKoj9rvrh/mwBE0L0AICyEIiYkOqYq1NY1XtEAyNmgRAQKrYSM+6HmgJ7YoFa
         n9h90gRr4+hovDtjQZE3aQX4ra7fFCDby2EwjRxIxLCJnv97IS7iCVtfBjKBZDvnztKZ
         u+XEVbCr1IbkO1OMgiAyZ2XStdAgwY+i5uJE7vBvvctMlgJ7k5nDi8IX7NVqU+aU09Zk
         XDrSu4UEqFQinzLyQu4PHBnhH5aswqkFrlFYjtviQxYHoURS5qeeg7WOAv5gy0BIjCUy
         41w+HrQKfXoaNFfcXvVV3UKR1gJbUklwvPQHA+Rf4hsbFPZBVhTRK3zrNpJhWSLQRuMr
         gO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427328; x=1796032128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        b=jt3P/s5+ENlIviR2wx0cOsaiGSRXhRKSBl8V6cPWqi2ZG3oro8DuunPd3Sn+rCFX17
         zMfVgfUhDcQwjYv67hLX8TIi8QSAS7q16MgErLwLwN4/vpVDQURoPL6kotPlQu77s7hD
         mIzg8Yo6IFeiWl+PBc3ADTbeWDSL8sFshbFzYRsxO/GBPG+uTm5zc5jr7Uh/hZDpJM15
         kxDlKi9dYJekquYh0NAZ/3eFIbI2dPK0BbmuPa2osW8BjBOJnayw/MPIxWmY4uE1gsiS
         XZReAQ25OiTQEEaZAOIE6qMYS545ii5sEe/bl/168NoEa8g8bfmno+aKs35KSxhEoipZ
         jOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427328; x=1796032128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        b=0x/UeGOUY6vgHkLmzciym9osLZhB9FB3NmpDkGqvmbZupRAUfh2A3BD2ogrkO3KMS7
         Q98TXQNRSWMHX3ZJntPST/rPfSI7kSYoXTIZKXfVZ0e7e1pHhfu3cvOgKdyHzNRvp+Pq
         kvr+4iONlhHm+M3qYeFmrEMmeMpFEuJXPf5N2sjqLJRWh1emjBHeOvVJCplHkmpFrmoN
         UFva/y2vM3FqcqwfoCbgAXeEVQ+S7tIoVIqiynhPqDMbX/pVnDUqB2M3TfadjJkU3X5/
         jqBUhqMAR4QDK38vZGoKfa63OrboqbeanJ8wskrpTqz+edHOE0wP+GC3fZwm3Tuc0yR/
         5S2g==
X-Forwarded-Encrypted: i=1; AL+hErEF7NV7lgcVSCUKqZLZ6FRSPbE7xHfrNvsbcseLxp0iMM7qwX7SaEaP2l6j/9ICQbF5rp8SD0f4mXYn8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N58KNrgSCE5OoH6Nv9aYjpN+1KBDDTaH5td2FdzElUGqW16ye
	+gJ3hsZiBgKig1aWwDKfFe2PcDH9VYxb3DXa1QcZ6GFub5RaGVxXnv7BCP/HS4gmC4PMKO6zZ8A
	hjk4SRMhT6u4vQm58YlSgiZv17yFe33nNHYqUMTUNeaKMILlv9B77spKad54H/S84YY2R/whr9B
	AvhbR0bBVSIk9haw3eSIQNsjc5pLByFeRGVURIhYod
X-Gm-Gg: AZFdTZea4N8MnzTWSr5Wxei+aerzToRf2COjpID51hAByFgyk9Y5OrH09uN48XLlpf1
	t31uCpIBUeqpLbqI3tHAnaNb1mCDv1UUAld6wwTJpzslSJItgzyZeT8Q2xSRuClP5L+wLVHIg68
	0Pgvo/yysdnhgA5rze2vzsKdGOqCiAnHpttKcaIHi3AnF1m6bG9O8rYKkhw3dinFIZ4oqx1mJ5A
	Mhg5SWraLVoRKvRyAQVTYW9AhTFReQRq2eZhj0WUbWqu36O4wfXEFc6oL8sBjeP4GAzybPP4Y1C
X-Received: by 2002:a05:620a:6401:b0:93f:2571:c317 with SMTP id af79cd13be357-949b36030b2mr1965841185a.28.1795427327817;
        Mon, 23 Nov 2026 01:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:6401:b0:93f:2571:c317 with SMTP id
 af79cd13be357-949b36030b2mr1965839385a.28.1795427327358; Mon, 23 Nov 2026
 01:48:47 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:48:35 +0100
X-Gm-Features: Aa3M54rkzVTTRdh6ivJaEKFjqvBZJ_pr635KpMrUDXoymBe5MH_JvdQ7RT0gKOo
Message-ID: <CAFEp6-1tFxSKQfFrxAobNfv269J6toEdX86MVMJxczW3NhWJmQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit manipulation
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _ZQG-OFLfQcazXSXcK_beho2A-DCcaZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfX8+0NC2xqRVOy
 LX2sFH73PCn1hSoV1yyjTuxNp8FmLNexIQV3k4A6FvLQn2tEDwbXsddTNzbzjPgxSXxsXhFDjzA
 ZqOsDIwKPSFug4lNGgruRMV1qWUbj3XsVrilvJFtiAl2rQM6MDecP97xReWAZcGV9m80Spii2i+
 E+4tg99i7vxDM7aMlsS8fxVwh+J6yENFG0fMAlaGy/Ht+iErehj2UBLvM9DKO9hFWI1ysjkfRSe
 2GWOQqjqzP+VBH3ix3b5Inwmy/VGYMn7mjrGO7D8O/cbVO0tR/0Mz0awgWGbliXmI/9A5fuRmTI
 IOpB5W0z1Ait7lk0iQcKsAWEOirEKCcCRFfk3Z4ENV1Uwgpj0MLjwF14vOZCWy3qmehImGux3ft
 6Ze3W4/b0FJaQsyY8x2uoTYQ+u3JQKue5Jd7hGmssZJhs8Hdyx/EyQkFfrpgTKTynBir/zW3v8c
 xLxmwb6d4slN8b80vNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfX7UHCBos6x5Q+
 qRVa9PoQ8JiNEw25HnCHODxBe+xIRV/6ap0psC1pj2Ucdq8nnQZHw9/PCfhDQ2oFxAJrLW/7w+c
 HVfDPYr2Fap68/NqGYAjER2CRoueWAA=
X-Proofpoint-GUID: _ZQG-OFLfQcazXSXcK_beho2A-DCcaZO
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b040c00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=suyyOr9kuGJANmfVb54A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230038

On Sun, Nov 22, 2026 at 2:35=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> In __csid_configure_rdi_stream(), shifting the u8 parameter `enable`
> (promoted to signed int) left by RDI_CFG0_ENABLE (31) shifts into the
> sign bit, and bitwise ORing never explicitly clears the enable bit when
> `enable` is zero.
>
> Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear the bit depending
> on `enable`, matching camss-csid-680.c.
>
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for C=
SID 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f..804c8fe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -318,7 +318,10 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
>
>         val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(port));
> -       val |=3D  enable << RDI_CFG0_ENABLE;

So, why not also making the enable parameter a bool.

> +       if (enable)
> +               val |=3D BIT(RDI_CFG0_ENABLE);
> +       else
> +               val &=3D ~BIT(RDI_CFG0_ENABLE);
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>
> --
> 2.56.0
>
>
