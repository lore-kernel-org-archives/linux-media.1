Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198288;
	b=SSgpoM4c8PQDBIKLpW/PJ4ZiJANw/BeVFTcWSBONbGKLvL+w2SR43jsCmtoPU0dyB4lR
	 haaY3qpOSXxPvIJbjUNdQBq1kmYWY+IyyEz2nfNtyWhZFtTmB1Pp4vfj2ujvDqmJ0h5eT
	 wnowlhiIBwSfGjYdSbNqxPCD6XwuP9Mkaa60rIVK081GjUd4kaLjE0hbLG5T1C/nbQUo1
	 eZNJHFPud42Ak0wPX2ydsT4gdhesMwAt9BZqfT71ElfCFmaEaniRlo/1fPbUUuQSpFzgd
	 Oa68JVbz6K3KaLKVpPjwuWsberlxL/v9HLCE5sRnGjv2NOfWpFv2Mak8aGkKnSsXrZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
	b=2b4qpnOJw9HZptS3+t/bzs36VYWLui3M2sQM38+UIdHENIC74GRsUPnPniryEhdunwk0
	 wkp+RTAXz1KnE6E13/wiOJp13awTKbz/lA/pxiOkfcyUT5rXp64rVUE2bW2PDFfwvb4vy
	 Rjo2rmXuLluSkFjIK6ydI8/y82DtBsBAuT8e4W2DZ6qUahbUVVb6tPhxYZuFZo9e53Pf6
	 +e6BM9tuw05BnFjMXp1AKsfKfIhphz4EeUxE+WTone95eQEKNjYxKVe5nd2+Ww5IUJT4R
	 iLvuGnxgfCWYn8dpX+qH9OADh0ZzRdDZ1tFIAfzHJ6DkUtdBzhV2Urwa+NkBw6q2G9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B27606A32E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B27606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2d81538941
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=; b=UxiT1FZu7pXaIl7o
	afbL0i7301WPl6FFAPnWDGTppgTtxlQMznq69+HXhqgcglzlCKuI2hzF4QjE/W9b
	kGn5KwlnIYn6xmWO29jLhp8Gyxu5LAKSt5uYnQOYuEHPLCNdcKGwpBLuJ4VEzBM5
	87rMc+4AUE2+YV/igthkB1cmLRhCrtvZ3xo5MVMP7WLogsmJBmUpHwwVDor0xhEN
	zbbrvryFZfrcIal5M/OpZEDdYoD+w9mUfK3qrv5802WPJeyUWU7OSm11rgZcNY8e
	nTzKUq9jmM3ggDgD+FIk4eILZv+nfyjGicM/RkIGIv2jvR2o1ykLuaM2glzlfDuX
	xPVIew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sdt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:38:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so188795785a.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198286; cv=none;
        d=google.com; s=arc-20260327;
        b=FI+pgq2g8Gw5zLnQzIEmJgylrE6laZ9gwCJvxTxSCZ1PL1CCX8rDOJV+V6Wx07TAym
         llx3AtNLekWDwyB/Qa/dgoMYZkEf/WMnFogyzqNPNjMwpuUMct3mXAQC5pMSGxZ9AFYz
         iI26pHEM2gMU42E1cDA6EDZKMbYRYHi+Fl1e2ERdeWoG2q/XxHo4WC+u6ECiVgjkUuEz
         ShxE41CX76VD6uST3YofCA4PpolJXqbg5eqvM0w/6gtuYFrxW6fR9FVMZb1+ITtB+B8B
         P0fZ6vk4oswJwJVpedAw5RBDZH9NtmnLH3SUu1aBQ6niy0yQd7OFKjGhphRWQrZ/jiLP
         KmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        fh=SrI2+Zp1znnKhJGR/ua+CZ/16DF1IeTcG/28akhldYQ=;
        b=QvozNszN0fgCHSZLCguloqUwLwIoapuup21ry5tmYoF8ssDVUAEQ3s5bvM0MQA3bJM
         1bxxICabnV/ehklPwuO9HRoh7c1URVRKY6qSpZU6u9KDp4Wv6SBBFI7i1xyvF6nfCIcZ
         jJFPDQlbfwYjylUFoBdbj7pILYQaswbCIxFXBC7oPKWPg7FgH9NiNesOUuriJzOiR4GY
         Q2WypA/m5ZejV9bsCWTi9c1mmv4U+wp0mfeeaNTDUGBqsWayQrFSg1NFP7cU+YzdfnHh
         I624ynd3nr+ZWcapt1VXbY6fxqbI95sFHZl4C4AEbyeVdOYwABQy3crlFZjIHVf3hQQN
         XYKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198286; x=1793803086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=kMG1Dc11cocpD5zT5txe/QmBhxyRePIg5LSls4ynKF+5XeKy3w4eeYGHWrszlF9d4T
         7AhWs2MD3zsBr8OZHA1u4csr7aAOr+vD7CUgo2abAPh5K6IuJAUszXzORLSAfYYh6xE1
         FqyqSfuY11Xt+b3YJVfO12mikR6k7jZ3G3SVgG4aojuV41+fcFZeKiKRt+9CglT+PGP3
         sxsm2xDCQO6ao09bOkgzXx5hD4OoS7JtJPoD6iK8DMfXM5IKrWEilCic0by2NNni3Cb8
         V/biY2ZVUpDWD5qkSnCVntReV+XS5mhTWxMt8hnz37OZFJ/HnZSeRlvedK3cfFEVQzPS
         Tdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198286; x=1793803086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=Sq1XlBDXP8x71rKHTBxbeHxO9KvoovX/9gvYeFb07Yk/OVX3rKoMHdG6d1kzyJwYDk
         n6y2dcMnSUXKOKPOBS+vS8wlXDbxGw8yoQQtUyDtVgdwBbF/2ESKr76LHSOMG7tZvrLn
         QHAxhNX/O4b+x+6ZyG+m2VqAcZaee0Bfiy6JRwF7Nyk6Jgg5fQ0PiLBAC34pqJBozHWc
         /+dQrqcQfO/dA/S339ji85kiti72iCfgvbsPQFSjiN02GSwUfMlDpc6Y7Rc4+j6U4Scc
         fLVv+KOWVb5mi3fkM0omMW7v5uOQiuaQELva8gQ8hRytr83JN1RZ0spK9xOhVwbc8Q65
         X6/g==
X-Forwarded-Encrypted: i=1; AKwUvBzfC91YkQJZUbXRqMFM1Kf1X7LImfbs+PnAR37+UbUWP0ugtJdPn6QvrDyAaFtrFujsick5Fss2Jwpg+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCtLhp/qKYvzP3PGhjnBwRqL3ve0wO1hTdhSnMCJ+nLut15CM4
	eergP9RfkyBcHddH0omVlOLAc2tX1kHDVcnVmT3aJk/4rduiau0i7C4moLMeIztmwuVoRIFwON4
	YlggPl7VUPXJG1JfKjjwWeQSeoZO0SVr2sHA48ZtLcEHzmsU24bhx0PBQlaECriVNYIVwaodqaN
	v+5zK8DgzLZI2kfA8arcP1ZeyISJrBaFUjh3VD3lji
X-Gm-Gg: AYBFou0ZeF9YmGOfwXpUOsBN9IhES6cYFwx8TqRFXdKd/Stiv5lpXod/qY44FDpidPn
	g/X8KiHaiStinR7jqKVU88LesdxbuG0STMpMWiFTzkP1qFLZ5FZqjQrw/W/ZbqSxmklMagiUotz
	KcF05rYbfGyZL+AN//buYdJo3O3kcp6LfQaSz7ssZd/u68l5uny7s6/iWL8vs1NKB1L4+1bzGEH
	RMiWXEqKmmeVVr0ziBdEdau12Xek6cqq6V0S2RZV2IMXTre5HvKY/Voy1h+SoXqLXeW+M9BLWE=
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id af79cd13be357-94408ca7bf5mr334749185a.33.1793198286051;
        Wed, 28 Oct 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id
 af79cd13be357-94408ca7bf5mr334746685a.33.1793198285631; Wed, 28 Oct 2026
 07:38:05 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:54 +0100
X-Gm-Features: AclHuK8TGWhwGUOmuxjm5T5HEecDdKCuF6DqZY64SaTBhWSc-y-SxMf8zRUIXkY
Message-ID: <CAFEp6-1v78-5v_VL2WbboUgcV6-unT7P0D38p==y2k84wfoesw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI
 rate from the VFE
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae208ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=bqr9HATVWjL3CuKzvf8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Om_nkGOj_3VyVlfCsNY8aR8KTrk-TspI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX8pepx97fFc1l
 ssqNnsgiavaoBi2qZCC+0sXmUqKJbZ0juI0q3w1+Qm1NN9rtnJc8MJAr6nIANYeYVMdtb5iwWW9
 a3pW7cj7+og0bF0boAuPVld6CNFSa0U=
X-Proofpoint-ORIG-GUID: Om_nkGOj_3VyVlfCsNY8aR8KTrk-TspI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXx34DOK3uE6+1
 GFAXUodyDJrYSmWynDe3il+GPpk8CfogVXrNVOn1lwcSDQ6/de496cSKq+3NcrLSOuEt6z14mo4
 Vlh/zxcClUmjIETdwiDljT1b13aVSxJS+aNGOQZYeqzZRQiUlyhURtUqTxI2A7qwHA7g3eZLzQA
 jfc9vfXJXRku8eYCV66iSmoNj/CCbuJLXO3R5Nv/sVKAfZIspWcSbFs/tSMCegZzyr6kIVf/i+E
 Ux9mdLc5c+cBaMdLbx5FC7D/JgggXTi6EzQ2TwXbHkYo/A6W2hI74Ja60IVG0SymDq1hw7MsXgI
 K6sIfm6B0z6ua88s4PHWP9V3EtX4IsCw7IFOQNOT1sfYgud81hxEA/ZZvN2l7r/I9tJURDGwxLg
 IOBudlVxWlvmQcSb/JDkgw4VVUURqlB0krn1bRYjjXEgzgu+G2IssuTAzs+QDazRWAbryimr7+p
 +So4EMhpXpsP+ci31CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
>
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share the camnoc_axi clock, so it runs at the highest rate
> requested by the running VFEs.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

So, as previously discussed, we'll probably need a smarter AXI clock
scaling/aggregation scheme at some point, but for now this looks fine.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 9e29b713288f..6c3e00e043eb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE0 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
>                            "vfe0_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE1 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
>                            "vfe1_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE2 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> @@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE3 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> --
> 2.34.1
>
