Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46D3DAAC9
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792638; cv=pass; b=iOyV/Va/yK1S89Tk3BUP0CtQUvpqLHZJ+7ZWb/sJ9FiJrrmA6jOAQUzG2VhMiyGCuNU0bAiksRqeff5ZL0IChBeNHz0rbBdYRQr5qNWEpA8nai/4HiPgofFk4lbeb2gmK9CeVgrJtpUp5KMXZ9ySFg0XLzE020W88TNF0WoWpY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792638; c=relaxed/simple;
	bh=lbZWNXAQg3rFB115wbs1+93TmZ8GPedv7f+hlCxp4n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAIC4pbSY+Pk5BbGV88ozekYFm8kTyitYwNtv91GmbNyqFAZ92GmkVn3cnTPkKJE7iT6BKozZHsAPwnFshMoZgt1qMHcBzyf/iuv+eNibGjB6BQAGD6Ha1lEAacfPPJwPIGEfbCK8I8midBuK/H5Jn7D8uY+BwiVMLYs94/Kb1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9onEu9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAAV11ZP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9onEu9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAAV11ZP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BZ6m3372214
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=; b=k9onEu9r7wqN8b4Z
	d58QjA+aijJCMU+2nJAnf4HrNs8yG3xpLYI3O2y8CmTG8rcM8fGcfrMth+C3npDf
	npBEaXEpfkj9fpNYLqBJW4RGsvaNNtG+Iize4rHkGK69ZN3X6eKazjN6MtlAdhOC
	TgdrsuUMB9RJhn25JV7atxOhs9NcSH3X+dwxQixFO+uTXyXVOP435/bvXwruijvt
	REWykGwi/NG87mIlV6bGljXxDH4EAPeasLDpCfgGSuUaOBXuOsM7Tcl2cWgTX7aO
	hRmapXSbBwwtj1ylT34vPBASlXtMC8VzA3bkfpTUWEEYveLYTbpBLmZqt4a4AS30
	wCPkRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qg54q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:43:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso26170285a.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784792636; cv=none;
        d=google.com; s=arc-20260327;
        b=D8lX7KKFwVX7U1Uc4M+y9+WWVXFuRzDsXtEBMD8NxOR1uroaILuXlfuVTYe9VcGNwb
         Zju7q8M+ABFW/8cEtKBB5dAC7YfF8qXCHikxwwqqPjSt4CWWG2vaknxYgKIJw5ODRetS
         vfHlhxOj3UFu2xRabJ6ckcFdMEGpfyHBSmwarBVUbAUT0ej9RcfQgFXEO3E+dkxioMqX
         RPCwW+xs9XK87slwiWMF98RV2ZOwkY85df+oTFHe036/p6SeDSZp3HVe5pKOgmUr8jVZ
         XfVmSlxyQ900da2UzAVQ8VhMJNqKfb3ZrhM54ojNP/wBBxg199kn9S67gn2lvTokLKQ2
         Wp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        fh=vT1eLKahm9jlDL0tJd+7SVAuugKAlge6y02zQJNHnjA=;
        b=L3datWwylWaPeC+WSbtIgHc1AjUh43Lv8CcaX1sZf5LnBM6pMMlTBxdEAvkoSITk4e
         poZZWoSizWZv+B50uV7ELCrYhU3cqYFZTbvD2liFLUHx0v10Rj9h8N51zi0g3JKMBlXw
         udh1j1xSNnaY/gaw5ZuYz/qg1dP3Z14PGwsgpVBjrab5lpuHfjY3jYoV8rhLgjgUxFRK
         qZ5pz5pLcyT4o+UZQfh+RH+HGiA/k048HctTyXPytZkgVX/rbarsW8LRbLreMMix5PkV
         rJqj8WaLnje35fWq4IxHjS8FxfeP1md/wdUs/OINN20khU3diGcZ6StfagSQ67CfKuHS
         JIPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792636; x=1785397436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        b=OAAV11ZPvjEEQIDi01HwE0kVY5hB8SACZn9dwZgMMxAfyMBCyfBt2niCzDny75vZ2+
         XGAwQloTrN6FGLNosvV1ZiGt/HWWmk1dakno+rzOeZiuC6xgwlDGs43UvWppG8Oii9Fx
         9WxPyVcQSYY/4MRqqUKrMmZTs/RLXT9RasW/t06KbfSm5TUMiPlmI2d6KDGXmhyN+qvu
         6K74Hs5gx7YolsXgWwHzFxQvHciXdNMPSZ3kRBQXWdwzWpdeEvQ1NRw7sxOEp2+zbfkf
         ULZotrYwjM6fnARqwXkF+u2I2upP8HYrt+I+XO/UVXsV46+9C5R9kHgx2ZLxy5MwGMcX
         1mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792636; x=1785397436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1rBTJCALOuPBAb23kUUtPChzvQMQbmjqzXwiOvXljQ=;
        b=nobteCDOdtlGdPctEkMkZnxLntMrI3aeA7lG0EJ4cif6SZnIVHCm/KwekLV0ufpOjQ
         Oh6qb7FO8CwV70nXGGUdou3fzvnsoxt8qNMeMzlF9M78DA4IzThKrTNW11jjcDNFkW/b
         F36yPsfKsj1xNPUUO+X3foERKrZ79S8JKAZ4KQjbBpPDs/enIw67C0EzoHiDnxA5kcnm
         d1QWNkINlb6IfrahOHZBAGPLHn+pAu2cLcGHvIdk0SwkrpHV09SDvKuRA+yvjomewozt
         lXoiMCgPD1CFRGxx4ACkGjKngFSG6mZd6X5dVXpD4oPtDB4TssaNNdrGaJ8a3RICkheC
         xy+w==
X-Forwarded-Encrypted: i=1; AHgh+RoimVTiESh1CA1rY0PWhj2JUuU40sLt13QmN70Q4Cyri4nxyx0+CFoJ2yUmUDBPgad6b1xsG/cBoiEbig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Piv3EGgxUGxMgnnE7Pw2fSrfIl7i6+NKRXRNOPSZ/0Ibi0wC
	rd10AdJubaSW27VBiWFsPjyaYK4YaGc6ZHfRqApcFpawrP47TvEB0+szQ4YI3dSEeBJjC1DzfgF
	p3V/OT666pvRi/XNLvh37NNMjJpxj30md8rQ4zMIIkFJoXqUz0RaTN+Y5k2HBSSrWEkOeV035zx
	FUN85qDjMVVApBT4/U/M/BGOJNepPvVHlRx72rU6gyoQy90/yatqA=
X-Gm-Gg: AR+sD13CWBnTl9iEdkd/UmIjtg/7Bex0Jld0xKKGR+lpqkw0lY5h/LWk43M8NxDonkj
	FLBsTKY5qOTpQRGlKtiVo+fz5s8PaHFLxgcpHjw2ZAaDvsMJFEj3juWLHjjf7+1OIaqr6YL6U9u
	lW4fCcUjo4JcKfv5w+Na5ad3F63CmCu5RkrlpRTCx5F8PyC8ELEU5cEmh5EokPQIB2i/O2Fh56I
	ZQSJTb9KYSojU7u5qsrzJOFr2BEdtlQLuaHvgq/WlQzBVHn2w7UVlaRubzqFwZbtPhnFbdYkxA=
X-Received: by 2002:a05:620a:880c:b0:930:866d:f86c with SMTP id af79cd13be357-931048a6bc7mr139451585a.34.1784792635568;
        Thu, 23 Jul 2026 00:43:55 -0700 (PDT)
X-Received: by 2002:a05:620a:880c:b0:930:866d:f86c with SMTP id
 af79cd13be357-931048a6bc7mr139449985a.34.1784792635091; Thu, 23 Jul 2026
 00:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com> <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:43:44 +0200
X-Gm-Features: AUfX_myzqTqCuLiR-4itT8lXxIA4rKlhYdQn1IVqV94j8_vfXwq6MRoyP7faEcs
Message-ID: <CAFEp6-0dg+nUJH5EQ5KtAnbsgKWKEqF1nLWQY1T4=RM=+LXy7g@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX1zm2BHtrw8Iz
 azyJnxvYbBga4n9t0EgkFLQNR26XFFG3zNnViOZ72MwzlYlorQ3HM7Y0tCAV5/OOT+VZ1/c0tgU
 cF7TMrBImuS/lecBPcVCqGaV2o6+9vw=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61c63c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=GaiK6TGL3l2XU-kOEGsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BykqSBqw5g9fXyJ9gmb-yZA5CYzb2FOV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX6fUIQYM3NSV1
 SIqte6c3V/8CYcEU4Y8LmyubC31EA9O7DeTbt6sWjPp5kO5I8kbMMWmqgSWB6Iogah0EY7lvFyB
 WWZ14a8JOX3gtbYmJNz+DrOUemhIUp6uA5XaFF61Cdb2xnxh8wozMSMdNOI6J4iMd99Jc/b4w/t
 L9q9K/xtm/JLvF4RPmbva+nywfBRqEAMS33hlfRSeckoED/nxabS4g1x8+PdlhnScbexrm5JeUM
 sEuJiJSnM7kbqXg9XWmG2m5h10RCMUer9P0Poh4YSU0ns66l3A5TjIdarfr9PxrbuUJLOpuINXj
 JrikDPyzbuXBZpLnlVTZsuqr5oN5jfONrQ0QElOXvnI/ergAzYMv/KxEcYDvd3Crm7EIMwNOdyT
 +Z93aTF9WPN2ZaOGA8uX1j4fGaDI4yLm01tw3YmzvVNwAr8KYAL5XCMgaxp1W7f9YL6VAVnNMEZ
 nSRMWzejmTlhYCOaZxA==
X-Proofpoint-ORIG-GUID: BykqSBqw5g9fXyJ9gmb-yZA5CYzb2FOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230076

On Wed, Jul 22, 2026 at 6:37=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
>
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
>  1 file changed, 2 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 477358dd39fc..eba14a6ae7d4 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3657,72 +3657,6 @@ static const struct resources_icc icc_res_sm8650[]=
 =3D {
>         },
>  };
>
> -static const struct camss_subdev_resources csiphy_res_8300[] =3D {
> -       /* CSIPHY0 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy0", "csiphy0_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy0" },
> -               .interrupt =3D { "csiphy0" },
> -               .csiphy =3D {
> -                       .id =3D 0,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -       /* CSIPHY1 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy1", "csiphy1_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy1" },
> -               .interrupt =3D { "csiphy1" },
> -               .csiphy =3D {
> -                       .id =3D 1,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -       /* CSIPHY2 */
> -       {
> -               .regulators =3D {
> -                       { .supply =3D "vdda-phy", .init_load_uA =3D 15900=
 },
> -                       { .supply =3D "vdda-pll", .init_load_uA =3D 8900 =
}
> -               },
> -
> -               .clock =3D { "csiphy_rx", "csiphy2", "csiphy2_timer" },
> -               .clock_rate =3D {
> -                       { 400000000 },
> -                       { 0 },
> -                       { 400000000 },
> -               },
> -               .reg =3D { "csiphy2" },
> -               .interrupt =3D { "csiphy2" },
> -               .csiphy =3D {
> -                       .id =3D 2,
> -                       .hw_ops =3D &csiphy_ops_3ph_1_0,
> -                       .formats =3D &csiphy_formats_sdm845,
> -               }
> -       },
> -};
> -
>  static const struct camss_subdev_resources csiphy_res_8775p[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5555,13 +5489,13 @@ static const struct camss_resources qcm2290_resou=
rces =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> -       .csiphy_res =3D csiphy_res_8300,
> +       .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
>         .vfe_res =3D vfe_res_8775p,
>         .icc_res =3D icc_res_sa8775p,
> -       .csiphy_num =3D ARRAY_SIZE(csiphy_res_8300),
> +       .csiphy_num =3D 3, /* qcs8300 only has 3 phys vs 4 phys for the s=
a8775p */
>         .tpg_num =3D ARRAY_SIZE(tpg_res_8775p),
>         .csid_num =3D ARRAY_SIZE(csid_res_8775p),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8775p),
> --
> 2.55.0
>
