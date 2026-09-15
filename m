Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87838DC72
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477191; cv=pass; b=oufkriOfmGSMQAKSrTdocJ3o5yHb4F1Jh0RaIhPMOn5xX7D9Ja+GDhnPAAhm0MJWEdsbohbFwIaWAorGvy/0Cm8XmqMVqzPHEFpRFeW6C1q5RIQshxwvbSi8n4lSNyb7gcw1DmkmEC2Z7Y5tpmiqyHM4+p2MhlkMcFbRgpMk8Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477191; c=relaxed/simple;
	bh=gsjyJrh07JlDH9AvGcFVcXgZkOakK3WLU3t0Bnw/WuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF7voGwLYFWsGhcMSiqvxoTfaZCtcdQno8486tcnmffpxzUmKogko3PVEVKXnT1laqLkMUuQahmQp97KRwElHEcvBQ0CJa7ABOIBN5u8LiuqbGUE5BrYn9hccdAqjwTKRXER1N9eFZn3wm5QOR+Z0DsyA7BXcrLGGq0okjClfzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj0o3g7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj5aJDGj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj0o3g7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj5aJDGj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxnnb510308
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=; b=Jj0o3g7VHs529msO
	s4GUSHT7/qFtDNIpVy23u7/aBez6cIjA5NnWpG4ItziwxuLr5TPEEqO5dx8czYP1
	aUt3hJX8dechE2d7fj0C9k5p/pORyPy+NoR76Yl65bHkhnZVZcPEnEu/W6OLkbGV
	1fmf2PQLZFlBgXyDpnaegKzS7vTK834D6HgG2fwwZWsPWjygqMkMVstg8MSCCqEh
	Utpa743q2pTi3u+MKRFbJOn8lUtt1VSEb4oAE0pTqle3ukLiS/krPe6dYe6GUcOL
	OuQzx6z2sXTAzVJggHt+R4c8u7mFRfnscLahNDaZiSWXscLgBeUxEIB7QTWq3AlY
	braKFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41vpt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:59:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53094ff7090so117588331cf.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 05:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789477182; cv=none;
        d=google.com; s=arc-20260327;
        b=Ifqoqg+nQlpEbJy9QFE44wRTJT4T0ru/mCSLOjeksJghraTKpwS7X6pcBlmgLcNim5
         r6MxYq2Qs/s5JVPo8+hS1ioz1Tc9ckP4DDMk1iCw4gRxmj+/mrtxyz+UmafailSsDyZP
         ypJQQMegTQqCNQidvXXTzDPeBmpjawwkwq22AoX6XVdmRhvvYkL2d9tmf1qL2dWDnNgY
         4jbQjv4+3FS/sZ8zgcnaHVxv/Jm4HgD1IwzIJc3vpBnlMUi3WjkOXXrvWeeWXgrCdTe4
         bvjiEhELJ8X5qfzHwC5OnJEmiY+R2L8j4YI4mSniqfAjp8dByin2bV1EcIR+qWs0r52q
         1GoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        fh=buaare0rmvRCpcNJppLHWVsrDUPPU8U6MEBCsw0Xc80=;
        b=Dn/S6ptPfpLHUgU4Id6a/uqXmuNtZfdnoySgdPVPSuUh+J581dfMSjQG+hybzuVraQ
         1v5uy6lXE15zl/R9qTlptDvVN0I0srPC8HHcLq5m5Qp+UWubt+a/93kfZzs/IMizrEQf
         DRTAbfnKknyF+wPb+3pbIavt7PCwoz2v0EpGxBMEjKbDEJK2YEMTUszV++H4/qISwcv4
         CpUABl4NEe/Da+kL0VetdVxZ9cH3imMAvEhkiJJZVpY8Q/t8pdCJfbPmO1BB4Qtoyxuv
         GNCMtzzql1qxXPu8cYx7Xmn+14LQGFmoSXNwgrDTGsxtMCbNxuvpy79spu152Ss6J6AZ
         ObIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477182; x=1790081982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=Aj5aJDGjQVk5DHANNpJAmnr1KoWh7aL06u/iubGDdBy4xoWOXOMO+u69SJhzJfC0A8
         dst4wmsRsh7N7Ibq6NILnZmk/+qVVaYOt/vMuSevAo28HqmdMdfxcLLLBmnhjr1uzwMi
         yJqAY7t9ipFpZJ8d29bpyb2bAX0QlkK8UhXrEFb7fOIcSrLjq1Ixtbn/UzgXeohbDYJW
         4i9EBqCpABrBXdrNFJ2FIK8cm3pBdfqDKkQiHkFlJvg/+Qwi3Q2esLj9cNhMYuuPMoLY
         Qgy/2BWd1Av29pnFoOCKvyaCLFoR1E+eaeVUt9e1YfsdRqhTC4JMmgaDZXIpsOOQRdtu
         yobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477182; x=1790081982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=e8eav6YHkG8Ex5TZjrgO9LYvA7zqxvSuAJDXDZO9FDRHDLEoOSg4RXD6U9YqHXK2hs
         6VOUBUW54jW10SxidVGsu+rc6VcRkMc3DpqRVQIW2/aCFaAAuABua0aqgLKxDA4HC1xX
         +HdZSsAv1PnQWotZF/bjv20DdaZvDHylPrHi5Apv9jZ9plT63t88aGzAjWkkchrdT78B
         CshoSrPsJUzxtmCTgPEo6H701DfzEHRklfgEM6BPdVDd8K7aMbx+DRrEHM9EKBk2Cbtt
         BM6jIuDMSCB73pg/3SAhyhZ1m8Z5jOkrDGoD9E8JOMxHcCndPeBnnIDW96Ko2rLgR13P
         k3pw==
X-Forwarded-Encrypted: i=1; AKwUvBzyAzkcecTeoQs0dHYE9PDoEgHXPdHI4kAyJWMzKoH6ADwLyPb6XV1xSqpnePhAZwMSzs4g1D2saUv1OQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nJfFPky2eFGQfq0bFyYDf4v9zYJfilcW5i213jLbIslVXIl6/o
	wh3fHIBz4FlEiZN+DRKqAZyC8SY2dERC2Hs/lPgsaOrHRp1vnxVzP5oouR8zB0A8Ip7khKdrUTZ
	Epa2RicgFXuvrEoL7ZBes1Pn2IJec3R8Qb3Z1n20I95UcrpRQ4XxdcBSlOy5BirbGtkts8TgR8A
	jNF/Q/CSp7tSd80t6N1ovMSPkiKH+LZZo8Djf2duRI
X-Gm-Gg: AYBFou3YN64uygduIdidJhtJBLCT+MDKVZ81NRn5Ywr4WaryMwlzfEk/nbYguWLMZ+u
	t5bxauv1VwzmatBlNkyQ2Wt2c64qQdG7/7PfU9L9y16hog8qCTTmPUAIBhuwvLkxGlm9zqYG1J7
	Qaxj5HVYoe3rY9cF8Vtmyq8/d1NmnOxAmsxqVXzaiis1AcCcqPdTO17o8Fbw4EpA7PQetpEXDB4
	6zrBIBH/bTXJMFxjj4FywUl5blds/AGG8JPGFNlCIhZ8JorujgADQAWep4LrdkDTV3wkXlDOhLd
	uQ0WYv/hdTWoI8xPjmuoB7Mjv7oK
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id af79cd13be357-93a29bb3b5cmr992163685a.48.1789477181855;
        Tue, 15 Sep 2026 05:59:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id
 af79cd13be357-93a29bb3b5cmr992156585a.48.1789477181359; Tue, 15 Sep 2026
 05:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com> <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:59:28 +0200
X-Gm-Features: AcwNN1U5ctkEm4DwFkBSfEfQg9_gGH1ZHa_iPM8quhRMcHD1Qgxe4V5aAf56VIY
Message-ID: <CAFEp6-3wmGA77cKaOgDUxsFSFaa_q4StNkVPrz23jN8r2HaF1w@mail.gmail.com>
Subject: Re: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfXyQB5fl2iM+v0
 5nsx+KfYADIfhp3ZH73NJ2oIJwgO5DzghMDz9xVyENv2aG6x9SdJ7EXkkhZ4JFvYxoff2BOaDhR
 TIleUtc0zjve7U4uln9qlP/bdBHp5lAc/RKv9FXCptzabM2S6WaSn0v1oz4GDxYOCSPiM4NLKT+
 5BmQHTGcpEVYU5VqSQJzRGZ2SJKvs9tNafo09sSpsvAERA3S8gHqNrjdZkmp7xP5dKp1mQ/c/0X
 lFTvDwtX+KOzJ/H92QLcBi/2ImXvOfiN4kTlZhrLKkcCJ1XQkZxlpwHFL8VSOHoQAz/Dq5kef18
 ixv20cQ0jVKv5dvOX+8uB+Qwnj2raXQpd2hb1wPAdMhDKhy1UhFRQdZlhvB20EcAkWo3oQOKG7x
 lDrAVIdczBBlLYViBGH+gi8pvpo+LKP2zv8U0BRMPDQY8XSLOtMiw6Ne7TAjJYXo1QHv6W9YuQp
 qSTb8etdtaqNmAzgFUg==
X-Proofpoint-GUID: sFnXx1s3VxCnXeYXV6-DWfP5r8ViXaQk
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa94145 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=DkjGjKK6HQ8r0z3qK2QA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sFnXx1s3VxCnXeYXV6-DWfP5r8ViXaQk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX8NOsF0DPeXRW
 wjec3SzxaZysZCxgL5NNVclXrvrwCuwlvJUpRhkXU+5T7dBMNjXPpWQy+SquvaAQkzNWKcbVX/k
 jjk96pN9YtGwfAvNSYAEUDAIPSbN/2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150189

On Tue, Sep 15, 2026 at 12:10=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
> private data, the private data just include some basic information
> now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
> resources.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 07b3cddca584..2c9f02bca809 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
> +static const struct resources_icc icc_res_kaanapali[] =3D {
> +       {
> +               .name =3D "ahb",
> +               .icc_bw_tbl.avg =3D 150000,
> +               .icc_bw_tbl.peak =3D 300000,
> +       },
> +       /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +       {
> +               .name =3D "hf_mnoc",
> +               .icc_bw_tbl.avg =3D 471860,
> +               .icc_bw_tbl.peak =3D 925857,
> +       }
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_8x16[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources kaanapali_resources =3D {
> +       .version =3D CAMSS_KAANAPALI,
> +       .pd_name =3D "top",
> +       .icc_res =3D icc_res_kaanapali,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,kaanapali-camss", .data =3D &kaanapali_re=
sources },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ba3d51d9c0bf..fadba57c5efa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -96,6 +96,7 @@ enum camss_version {
>         CAMSS_8550,
>         CAMSS_8650,
>         CAMSS_8775P,
> +       CAMSS_KAANAPALI,
>         CAMSS_X1E80100,
>  };
>
>
> --
> 2.34.1
>
