Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793353242;
	b=B1E54N4jnM/YfOyaWKKD/KJshBP8MNbtqMFIli60LHgWXOhaE9ZBWnnUMmubYCute/Oz
	 eQsiiRzbMQIcBG64s+T3GCDNxoi8j9BttBal/ZnVa6Amdprhe1Z4684ssK5lHHjkmkAVH
	 TR6FDhYRTRGzNwpEm8ymCv3hTOgRN2crVWjWGKOQCZIzkyggbdPHEuDRjh+HV0CFo4mhl
	 xKYxCMPkZG3+RC4SgqqTj7+lhwd8IBQrmY66ZuKVBlZ5pR+QrB3C1a6altX+T3uwLJTU9
	 eLTFxexud8dOhqeKpZjrw4HDnDanUWcR2XmBBNgwT7I6dh7SWxpYQa6BgYcLNStqEPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
	b=irsDVuUDKGC/L4QZ4IBLdrrzrZccIoNvGxWEJafpNMSmvlTI/R1FMSzCxR+l2ZFsy49u
	 qK8RWUVIAr4rFIsmw3nsaQwSGjSmVxAQ/jf4nX8/SOBP8E51ohvVxnybAedxzNhig2Kh1
	 MsvScrsd8kShBaNqAepzRimlwQ+ecRyuxGkOUK1uhQqaFSaQIEMGCMuJLEn4+4IILlnXo
	 tzvNAS+wjr/SIj58/C8FJ8rCsZA1YM3v89G4hlIxKLl7ZCSsFlKWPsDyfFFJfSu/XSWx6
	 /xDRvCLcC85wZUzH3EVxW+iMvd9m/59cqnjRkNiG4grW6hdh0ezimCpMr/USGj5OGfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6773606A332
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6773606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2s91761920
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=; b=WDUyCTskAnFWcD6H
	yNvcJUWE4F/A/qbRutoL34bToGe02+HXlmv1F1CRPWAAQri30zm+jlTctGK7kGTv
	u6UEvMbQICt/EWnVZJhpuUaHwfuIxyvTe9DE5wywkRwG4F+uFn4tR2QusUenlij4
	rQjcLRRR9TsDXlTmBusCR9j67p4eDNcEaLbDt4mp6lSsLHTRdVIz97u3Y3/XK7y8
	AH4ok8+XLI+ZPOXlbyLCTXg57B93rOJaAdlRS3GPPZN4nqVasr8R1OpP8l7waXbu
	1nlf846OjVYCsdMMzttrjRfyL4wj1/3t8s2mWwf90IECJfKpT2fx5BNpmMJ+ssTc
	LN1YBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa810-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:40:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso73214885a.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353240; cv=none;
        d=google.com; s=arc-20260327;
        b=FjOPuellVR5XYI6cpiLYKtpzAXBjjdmCkLT9LXQ106og935ZzaI0dx70a3BL7hK4/J
         rOId8QQg9n/OCViw0qtZCzaGRzWfIi0hslEV6PvGd2s/aLiFu2xhKWJauAwXxuKh5Ikw
         Sq/+GR3iQ4htjPG9F4uGCNbXoWOJK8sHS0/Go2GrYWhoCggBXb5dOMF2jb1K0ZgTLJS2
         La+wy1yAJmbrBFmEdusTokHlY49EANAIeBVf1LSDYU2G6URTyk1M5DqUueGOi4lq8+ZB
         Tl2Sg/AbAlVahuxd1Fl//m6EoTpqcwyGyKhi7ZA7E2LnDcWr7ZsXCV7Eg+RjGe0k701M
         FuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        fh=oQjYzRfjyyC3768pKFyDwZesrt1MScAAOYpdS1WeO30=;
        b=oWVtgq1hYz9Jlg9Hf7PLgJ6i7/9U6T7oK59bB3XM9Qa4Cr2BMU5Or2Lk6/b4TjEacG
         WDeOquR7iLCqvcQ/Ubkb765dXzI1H4ZgwWR4wf1I5jt+I9g881Rqf/QEcdOxg5IMBerl
         vakoYKT+ULvqlslk1qXhYikfP/83Tnk4yNg2D8Q6oT3C3n+JhyQseXs0LV2nC88GkGbR
         jCMhhZ0bA8peNJwE4bWMs6HMc3yaYNw8HXCH6HCm0Ww9ujqtds5BEiJ8ZP+EjqHwhD+i
         rH+dNq+vIOvCaQD8SEoTWqJtyurHOO6LVr81Z1zsO/BaqMw4+knwVggiDAvP3Q69a9VP
         c25Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353240; x=1793958040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=FN5uMiVu57T1CAppK/bMjDbtJUI2ISEL+MqXc40uaLLJ8uvqHOiz6sH5V+dEUoRkrE
         mvHzYusljoz8/9kU2QXAjDm7r3KmuOv4ZUyY+HhDWPxwOJSzWg+s0RazS1Ch4HUXazps
         HUv/Mu8dj/iM3/bHVb0k8KErqNIkQqY98HH3ObovURd3MO8DViUFJbDubbHkeQUxzbet
         tUfj6yhKqzPc+ch1b984Hq5mKQAV35akLWYNCNko4KGTp6bPcRVZw9qAYGrUYH7UOiyU
         pmK9oaRN2Dg/OYxT+45nOkb+/T54ZFKP9Fq6x24OfGTMNmLltG5W/8Pvlyt44x0eYlnC
         AipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353240; x=1793958040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=0XcClWdbAXrzRlAA3gopnoyuO/vYSYvZhZmcsmN0zHL0+G80DHG5yFag2FSSR62C6H
         L1hWvEl+RcliKq6M+HReUWv3bMok06wcOXYg+tGPAgDCnuqRgcazOx4t3G4GGBa/v/+o
         WwZNf2B+v24zK/86k1/33HnGmY796z7l3gUL4loPAMPXsvZJX+UQTH0+y/7ykhjjdfEi
         xn5rtp4C27epRbtYCzOnFqgp+Xhmng7v+3vTq498PD1h41PuQ2+PRBnlKdOEOfp24aoO
         Gn4/efJphENRI2r5OMC87f2JlaxnHrclFXNl9EIh7rURmNJaT9h7tGnNUiX0F1oG2W7q
         qDWw==
X-Forwarded-Encrypted: i=1; AKwUvBwPzTX2vJuDfMisEc+KUUscbhJVUeX/mmNua2+AIaTNqHl7qtX+gOu6w41QVMjsuWCsop59S3AvXnYcEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcy43uYc6WzCcHk7IeHwQ6gLnvFzro7S4rW/Z3AyeY4roKkv8o
	X+ZNALmvubCAspP3BMThxwuq8kKSAyYAF0Rz/R1UmuNVqQduzXUARmy/dO5TGFlPffTTZjY6niP
	GJujERgONTaUMLg7XWj1P2oMqJZ10SQtZKjZ+RZrOXpVMAGfRAhlO8XcqPG2p5A4pRWQQ1YDNOR
	zuI/cZ5vurmm/aL15l3INS1sR1uRwCGF0ROS59r9x/
X-Gm-Gg: AYBFou3JHlsSWZqk3iGFutdvLulWPtSVaJgORcxtDspe1xj0QUqS/EMHsKXDaBLQRKn
	7BAzalxms1rZ47VRbJuDYPW7FObwuBJpBDWfVZCJ8tbRIdsYaarWMzxwHcqN21F3XlkEi1ICstH
	4lW86Zfb/5zTNANygJE4VSaOuKJGDk6KvEtFqu9A39gRe/0qYIu7X9FAjtVCXoUowmrjaA6i8o9
	2UkTwzlzF1Mwgnu8SleGdsf8ISnyWCF/UgGCIDLSB7ECF+feInf3B/ZhhjCFbd5r7A+gWRLdNoi
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id af79cd13be357-9442177e372mr252812585a.30.1793353239905;
        Fri, 30 Oct 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id
 af79cd13be357-9442177e372mr252808785a.30.1793353239275; Fri, 30 Oct 2026
 02:40:39 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
In-Reply-To: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:40:28 +0100
X-Gm-Features: AclHuK_Nb7z64_X16sSt8eZ5KfEgiXwPK7nYj7Hkj0Nd7L6xMjrKtPUseHaWH2s
Message-ID: <CAFEp6-2b8M48sxvV-bux_cxBJ-jzpputHdJrBORJ4d1w51nzSw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX9qc0CEWt2Sw/
 tV655hYfnc+ltEIvxUX3CZrTj+FTK8Zylz1UOj/Z4Xwwl1CQ1OT2aZWxemy959ZekTI4EDpNN6x
 g782topi0L8JJaTdyVXMAQGL8MpxpIBAk70xx71j8TdAMwQ53lzYeSHGT2lOUjOCXKfeIDOpvLk
 R1YrK57unI3VjZlAEt5Bx/Q2htHkmLMAbxPJGzRCz0B7B6SZX4eTfTCAt9xnZAJ0rptEjmNkHzp
 oJa+gkwe3XyX/QpSrL6kXKpgnfra5qZF+S8rG3XIjGoszw9+o3p1uUo079IOHjnjCXQKJ4Drfec
 cjMD1cHfQB9Y4cuZBefYVf7Y/74IEfdEH9gaslJz+hHWSj9Gh3/FeIxEZbNnuc5OFvzKhAcrKGL
 FZlfFni5ozA99QZy9+Rd3U+ncbQDzfWPNmoz7EbiSSsNrKIUHYZNaSiZ0VnWKrJh/fT/uRmjgtE
 YmBV20MglLchxVfACOw==
X-Proofpoint-GUID: w0V9sgXQN2OBXttPfxSb3Mg6eOFfLe7V
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae46619 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7MKz-gpKVdlp02d5jGsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: w0V9sgXQN2OBXttPfxSb3Mg6eOFfLe7V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX3dIsMWCHNEov
 1z1V96G3c48fNqiJEG5K4c8s6w1dvHwXqV7FYRcplFiR1pXux9ZLyw3fFr8/o2lo619eRiM5CBY
 li6UboLoJQUUupFOiWndOiVCVyZzWA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

On Fri, Oct 30, 2026 at 10:39=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> vfe_flush_buffers() returns all active buffers to vb2 but it leaves
> output->buf[0] and output->buf[1] pointing to the completed buffers
> despite the lost of ownership.
>
> This can lead to subsequent flush or completion paths operating on
> stale state and potentially completing the same buffer more than once.
>
> Clear the buffer pointers explicitly.
>
> Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
> pending buffers when streaming is restarted, but nothing guarantees that
> enough pending buffers will be available to overwrite all entries.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c2=
5a7
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

Please ignore this patch, wrong commit command....

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c41=
2a2e29bf840c870 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@3 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> @@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@203 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6=
e57f484a4e41898 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
>
>         vfe_buf_flush_pending(output, state);
>
> -       if (output->buf[0])
> +       if (output->buf[0]) {
>                 vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
> +               output->buf[0] =3D NULL;
> +       }
>
> -       if (output->buf[1])
> +       if (output->buf[1]) {
>                 vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
> +               output->buf[1] =3D NULL;
> +       }
>
>         if (output->last_buffer) {
>                 vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
>
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-camss-fix-4972697ef90e
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
