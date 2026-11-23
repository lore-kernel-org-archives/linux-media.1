Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427638;
	b=olLz9A4D4pmfMovJapkGNjYMBccbEQPOa71krwCsn9Zanx6ne8Ku4LDo+o2bxgXbtyJv
	 BvpB7R67Ry85beyzSDyOCLENlRosnsRhxjeIjLbkAgQZbSdqEHl4m2U36Pa0PPVWl/ELl
	 HF/Ro0VsLW6Bny3zQvFHz3NodldpLJeFGiIesT+gIejqHGIRONNvY52CJhv9tlEDKssEA
	 V06oV2XnRjKGXMljY0t51wV3ZQe3aTMJAY5RooH2HdIjhkZLWA29jick+4F7JkeWQXhq7
	 /e1yEIQx5bIhkA46JUr7BKagk+7X3pVwdf0lg8rnaiCjmCJJtQTy/HIGy6GLHwTwDiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
	b=1u/6SDEHD8wCv4TV/POOEJqRaAiy01Tol536hqKi/w4uFGoeoHLW/lJgk4S4ZaE+xHqt
	 cdQfp/ILjza3w8D2ywUa/Pc/OUYK3RwglSLF6OEeo0XaDeDMYzhqom9MvvbsLe6AssHww
	 GqEC1R3HMnxunWU0jBrahZFvs8/SAM9/DJd5P6w0ZLTN2djUbi4zEba0yRFEazWcZoDDU
	 ++troTUccwm8IVkJyQAAD7wM9Rd3qAg5LwsbHjlfqzHXA+UW+/zMHonYeBjo0OEy+F4SU
	 zfoqfIjq18yqe/kok8xHV8rELxEFLEUrrxD/JtTLgu9h0OHJx6CFwZsDbSoUT4jmGPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+8JwThg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5gleDKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8985606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8985606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+8JwThg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5gleDKs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Ia333490961
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=; b=g+8JwThga1A07+MM
	qt41dcAPLLfWRynVfA1/SkllOOAuAE7RxPhiAJdOhCwiBSLO28meZMWD74T/sjsg
	14isrZUTn/he4iGnoF2Gol5N2lNzknqDsu5HSysnGpV36C7RbSpA5G2Br0spULqf
	eh6M1HNF1qxhftPLrFXpGI654VGIYnVhoQja9CfiKeVE8ra/QeNBnvrPlrzWAX8k
	NNYw8aw5LEAU4JQUSSVxqcN52gYXxe/0iCmRD5Hhk/frWM8lPJxIQzzKqKfHqWFk
	ZXhDAWOUxaJxq1zzbEMYOCdVfP6Z7B3jgt1etkeY7uS75FMhMxkUAjKOVbsE5bIk
	Zk2opA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsh0uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:53:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210ad74fdeso58020896d6.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427636; cv=none;
        d=google.com; s=arc-20260327;
        b=UZR+gOmmqDI2NFrVrEeSigVLHeGeCcgWEAwk+ob3NC7hqkA/npQ9PWFNGM4NT8jeL2
         acn6L0L9gJ9hk7EuJeZrdEGEhhixRCDMpG7z3AZNZ5o7AXbyv1yMEM/N6qkurv7WRog4
         wqsHxmBuHfJQCmcpwF4XBQ9BXXmNT2r0whNd7kzYNBZUsQorHpVYqx2rCUvkOk5gVD92
         yMwWmID3a0Db7ad9ZgG0Ec3BoLUJzxi2i4TS744Vpf62qRItsrhDKYIu9TOkbXXFzl+t
         jajwFydDUdoJeETWf4893VS5utJ7phERKfHRzf6yA5fLwrTpl/KKC/18tOQY6wZUY6J9
         jVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        fh=YjU/z+/eqxP+HB6iZTyFRdFPL3qGxU0lmEk80Kj5z5g=;
        b=HYs/gIMGeTvhJp+8ZFJk7MBzUrtWP0P9Ey4Pd5SXHJAADNEWzw5GrLmfwHusCzSfNR
         MSEVd2anfERvIAo6LfRHG7n1WELPZf2bUCY/gLFL/4Z9DB9cYVxO/KrYW5nvyO4/MFuV
         PDbBWqXlXFCJ8lxxQeNZVceWP7/lfW95ytKU7JIREvI86vV73IqLst9UZhTdWF0sHkWg
         1agEXyOForx3kkrEY6OTFoU6xZ7VkD/T4WfYkuBEaN2PqiQxWArlWce4uKfEmuk46J8w
         rAKbmdEkLippDOLRxGZxwNgesMqbOR+1+hv7Q1Xdqyg1BZfJmnRFCgn0KfUUAcswmrCY
         VnTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427636; x=1796032436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        b=f5gleDKsgLIO9vtM4URYt4Pvf4aSC4ZaaLq8SuRanPgErj7tcyJ6lwgcH7vH250+M8
         Eu52+eSWSW81ftDYQwdMLiiKlaSPTA9hs1yPNwj1qGOQ+gRcxL/v2nmpfxMNnwn/Njz6
         OLD/7MShbHJ7npz3YnO5Jkz3ByFXk9Ze3p/qnvGi1q84lZp9aP24RNQt+1y4a6kn+QD8
         DUdfw6EljXfKbe4vptr50LfbNMRTu3K1j6Xpg7ZWDRkrxKL9PEnT5xExRQ93uHE/C7GG
         xfHS2rB82ln3wRXtn55XkoUgRfExwnApyjClFWwY/hgsO2g3c9ZttkqNFQneRVV2FfjM
         FsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427636; x=1796032436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYuTps+JJgKR2xYVsY0PIVISQxx5gD2PG31i9Q69t0=;
        b=jWmgRyL8HhkXZ117IGanzKIYOUYYaWG0WTtZTafA60AyaWA8+fE70IdONuDBq/mRpv
         1g7RMOAbfMtCN6RSvS6fOEgpHSYaiKQTf1W9c3C2lDQBE4Kp4VdFrhpHsxrLfsPwJWTD
         q8WK3yV7B29ieZPkNnE+9ldeRNGgMVatF+ouAdIqT/RFciz+dsVPkZTJ80n6XhZRO+FP
         f3iVO60i0poXjMR9b9M5A3wiG+7eEAtRqqvzUx5RUpL/9JNN3xjVOl6K+JDKr5qmM2ke
         9iaQmMnjo6VURGLi4ayMMfJ3uGMJPqJgBds6JoOdkr3Uq5zjTyvqjcRx/eE0T3OWDmgO
         wXEg==
X-Forwarded-Encrypted: i=1; AL+hErG3eTynLuMrtrej3Z5XAuwXjywsO7RS4vDlgycj3ctK7hhW/c/56h3nyD01Nt1XUgdssKeO6AUBCKuvHg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PPt6EMD2vEsgQja8keq7KeDO+EPRAc9HVM8/WGPztYXgpYDRb
	meB9lrdKSX1g43tDtbrjQ5JKs8tJDmvcoKUNx5+xYWVIvEjbIKzB0zeAMnnleM6h4wbu/pWjp1P
	PmKnJBvjs1lU44swQyIvd6s0wS9O4xzyC5NpsHV3ESMSbsYOuPjEm186qJYLTqI2CHcHpvAEdDh
	eKeOL0/cDoqMsJ+DxXgZxVF0vTTKrsMEA0H9+iqXZS
X-Gm-Gg: AZFdTZfD8KfGHVqJeC9ybspwg9CqsMjbTEPQ53TBEUaMvt7VcQBTVOQFXGss44R5zma
	BxlLOZO7Gj04HzV9vvuIwixepc1qmOWc4IcsyNABdsgBSqAecPNz8oIAvl1a9xUOFR7mfkKTSCe
	QIERcT/tox1FJNKJmc6pU2FersfWWttCL8RSASUttR7tIwjI1RiA3zkstwfQ4fU6n93/VQWFj/K
	9Jl1EEd8PNkO9m9mQpzggnvHcw5fao/Sbz7fqVTCcJgeL6iiqyJUn5BvA8B9X+u0lqinsWK2REe
X-Received: by 2002:a05:620a:4396:b0:949:7c43:d54b with SMTP id af79cd13be357-949ba98df47mr1823198385a.30.1795427635824;
        Mon, 23 Nov 2026 01:53:55 -0800 (PST)
X-Received: by 2002:a05:620a:4396:b0:949:7c43:d54b with SMTP id
 af79cd13be357-949ba98df47mr1823197485a.30.1795427635411; Mon, 23 Nov 2026
 01:53:55 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:53:44 +0100
X-Gm-Features: Aa3M54p-9jx9h9N90YDgJyYG9vBUNQ4vxTHnFd6llwQocvVqp849Gk2savD9K7w
Message-ID: <CAFEp6-22Mdbqxj4wZOKo2DJ32YkXQsyB4MGtojx+fsjy7fzXtg@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: qcom: camss: csid: release parent device on
 power-on failure
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b040d34 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=gN1Sahebtm5x3it9UtEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 6gZHBzSmfrNHzDt9i9MAci4gkvY_aGKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX1jAWX80xmOdu
 lJJvRdisvBYm13X+a7fxLqDVpW32NbSOhWCdEawCu2YSiNgF6E9DGklZ6VDTPZSeKzgsprHzU3u
 QOXOX263SMDWG7hSDuq/Koup2Dwdj82ZmSjM0iqd+asNtk78ME7jd1Yh8/PVzaySbW9DRcY2YZj
 aCRNNmy7JJ0Rw/2+oJMcAxXDQB536VvR+kt/BbkZwg1zwXdO+DrFaApCLAev2mdmG1FsF9tNWaB
 Gahn+8GuS1N/UFld99K+vS1H9SZTQY7whzBr2cign/e3N9R6QAOElnkkAkPupJ4SDuUpvAcvkXr
 F8jI8gFYezRzWopHeQK93aUM0IyG/cZHPWAEImt0JWH+XscDxY9eMoGyiHAXwO5V95vycjylBVA
 ZVW9iFpV4OK7D35vFxS3Yip138sNIIk8uHQThqPh78hM1DkcUTCAn/JjqtBk+qwd3ce6nSXeOPs
 TUbTcVp418AVCsJ3+7g==
X-Proofpoint-GUID: 6gZHBzSmfrNHzDt9i9MAci4gkvY_aGKG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX+bwZ16dCcrZD
 NAhxfT3Rx+uY9g5kb3TfHPobuFZ488nvu9UHhzXAQo1QArr5y6lWz4yV9Z6ueV9vob6WTi3mytS
 YeUG7P0i0UtYDyZ1hAZc1nsa+bUA8GQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> csid_set_power() acquires a reference on the parent device via
> parent_dev_ops->get() before resuming runtime PM, enabling regulators
> and clocks, and resetting the CSID hardware. If any of these subsequent
> steps fail, the function returns without calling parent_dev_ops->put(),
> leaking the parent VFE power reference.
>
> Consolidate the power-on error paths using goto labels and release the
> parent device reference on all failure paths.
>
> Fixes: c5af8db84c01 ("media: camss: Do vfe_get/vfe_put for csid on sm8250=
")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 48 ++++++++++++--------=
------
>  1 file changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 51f2090..e67edc3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -682,7 +682,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
>         struct camss *camss =3D csid->camss;
>         struct device *dev =3D camss->dev;
> -       int ret =3D 0;
> +       int ret;
>
>         if (on) {
>                 /*
> @@ -696,44 +696,28 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
>
>                 ret =3D pm_runtime_resume_and_get(dev);
>                 if (ret < 0)
> -                       return ret;
> +                       goto err_parent_put;
>
>                 ret =3D regulator_bulk_enable(csid->num_supplies,
>                                             csid->supplies);
> -               if (ret < 0) {
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_pm_put;
>
>                 ret =3D csid_set_clock_rates(csid);
> -               if (ret < 0) {
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_regulators_disable;
>
>                 ret =3D camss_enable_clocks(csid->nclocks, csid->clock, d=
ev);
> -               if (ret < 0) {
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_regulators_disable;
>
>                 csid->phy.need_vc_update =3D true;
>
>                 enable_irq(csid->irq);
>
>                 ret =3D csid->res->hw_ops->reset(csid);
> -               if (ret < 0) {
> -                       disable_irq(csid->irq);
> -                       camss_disable_clocks(csid->nclocks, csid->clock);
> -                       regulator_bulk_disable(csid->num_supplies,
> -                                              csid->supplies);
> -                       pm_runtime_put_sync(dev);
> -                       return ret;
> -               }
> +               if (ret < 0)
> +                       goto err_reset;
>
>                 csid->res->hw_ops->hw_version(csid);
>         } else {
> @@ -745,6 +729,18 @@ static int csid_set_power(struct v4l2_subdev *sd, in=
t on)
>                 csid->res->parent_dev_ops->put(camss, csid->id);
>         }
>
> +       return 0;
> +
> +err_reset:
> +       disable_irq(csid->irq);
> +       camss_disable_clocks(csid->nclocks, csid->clock);
> +err_regulators_disable:
> +       regulator_bulk_disable(csid->num_supplies, csid->supplies);
> +err_pm_put:
> +       pm_runtime_put_sync(dev);
> +err_parent_put:
> +       csid->res->parent_dev_ops->put(camss, csid->id);
> +
>         return ret;
>  }
>
>
> --
> 2.56.0
>
>
