Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163473;
	b=jWeLJSLmp7VO0Kr7spWPkvvegSeqQkAFtnE6H/5GqZ+/fAg97i13mIGITGVaVY7PDNxi
	 hTgjzyoADTGuiFcY6v9Rs81QzCMhAjvLAV1IADGkpkv42PruE6kStuSSL2moqqIot05Xq
	 ytojF60ELXqm+Sobz7E1TKcJ9sp6koYsLh7ympFhms+HyquosoXLPyny8TXJYanc3HySc
	 Dr5HLcT/awyBjhQDnMs+O1tBXDe5eidoJmFF+X/sVs0jN+iwTsm8JMkvZ8cAXNAbWeE1J
	 z6NdnqF7Kkl99vIIf0BjXhfHTxRiZugEr9+OGaHTN5oTbaPJo2amWyZh84elEAMIQQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
	b=FadSDFuc9Kn7p1N120hCyavACqkmDaaEHx4pIRv5ACp2CVxZnzKSWkcZYuS5Z3QsolpF
	 ZEXtokV/0orLhxwVpSU51aDgvShkzWwNJp4/hqLcd4B+c7HQ6HtFTj0ev/pZATw7REd40
	 uiye5/d+0cGfWBKagLYevgrjr9eqLCmpZJeCM5iLFCwrA7HAxGYY+0shKQHMeZmV6j05X
	 czYaYM1fZtEZU1LFOOpF4HJsjj/4omZoZVZzHMPI49YSPh0E3qEOiOCp9PcVBw5794SFm
	 /pqfpRmeaD3G4jybHUV0qVKRbjXnEvDPVxJtjiR5uZ+sUJ8309v7yH9VAgD0QtaGbAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EB9606A331
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EB9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqs91268340
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=; b=LU3Y3XD1hN5TD/oQ
	pz6hWJygeLPcb9SMWjd+b1jhQYq1E+SCUds4bO5A5I5/r+64PMwci6GVVLVHnJDc
	YHttmuQ4yepW1NYCQ9XNTNheIdJULK5hfkYwwRxXYZzz9yFtVEChw8ApvIyTwOPw
	XqgcEcRDQC+vhnD7uMBX8ToyWGOZp9xPdICJj2zs9iFq80ZmcBhK04RdWAU4qShY
	gwGIiXb2BKdLnte9LCJ/RED9pBr6ZiqlVjh5GqPdQn8Xdo3yf9b1zJQQrOcyyxeZ
	9GqamWgzZlYJ+N8MEhuGoUZKzn0QnbXI1K+z+39bT+WLOZEC1RuO2JII48lv5fRO
	vK02dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sfcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so113795985a.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 00:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163470; cv=none;
        d=google.com; s=arc-20260327;
        b=qhm1Mgta/WYSRvKfNbOr1jxRlPHbzNX+LpIws9tleRTddDZb0zcdeeehUnBMkcRCGs
         mWhZkmlpgd5GGUqr0iolzx9KOqsbXASF+P+opV2WAVxiC9Xp3LbHx9eWcR7wPYJmo6/l
         +U7yBbG44i1Ya5P1DD4leA4E44Droqz51hb2SdROCpyWFNtDbmu51FV+LYCoNKZMUchZ
         gFHr5y56B1iL2QWoJAu0aT12/+UEJ3OA7a3fByNJMfay2i7/4zYbOvnKDWj6CBw4mIEl
         4S3WA4Q5KQ/iIwpegZEb52/31IIIX014hezSSlqw4iDJOhf0wbLXDk/rGg+VUfPfzat4
         VBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        fh=QZlrs3c8dTrUrWkOKfLhgCWE8z0JgfhnRU8GXHIo0JA=;
        b=R1BAHOoY4LPduMV5nVVJxMVubNSpGxq4tCluqH/JhiPc8o5/RCxM4ZyrM1/pBe2K3h
         ukRIkOYr1M5+JqJHMIvebUfG9Gi10Bk0jqqNIQInNLkQDzmxHxZbRZf7Y6j3WQKvqD2Z
         7xJGz8DtYheGZ9ZUgpsrYVTA7YuiPeSznNt4SwbEjsXxZiNbuVMVAzeJ1HJlO3iJ29jQ
         fb4YlQAAuo0+4STcQp4nYr/bketh9odWL8cKpZfBqBrfGclD90prqBnRZOUp4UVKEKAd
         rbVS5RzdbGxzqPKoCbGTk2ALrs6M6ybjESXAG7muP3dpqdU/EDNA0/60AUX8vDnvVoZb
         Bl1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163470; x=1795768270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=Py8Ekl9IfA7utoB0tDdW4cpxXAHzKw0Gyh6IDpWmT8EmgVSp2OiBfPp7H/yrqjbP80
         wiY5EFNEpvWT5MH1SgRtPVfbqPXz7ngDWkdLCIQApz3rZaCp4QHVwEONbsxvBhRo7yIW
         3asJ9sr0bFo40+eLjJFQ/MTCjo9Z7VSVCr5VqMhyEbmDnjkBfM+JpgTumLAHYFAmp1L3
         7zs2dy/AhSdxx0NpyqGK2kyP3xiG4cnUZBn/vWii/ld7Rexq2zHx85nbJ0koJ2qlwd0e
         22cCvjw23HJxgK0SqSTaMJHwU/4+yGtC1cRZcT2EBawVd7H1O8PtLkyrY+OyAieiqZxN
         xzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163470; x=1795768270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=ZZ0yVI47AUsTnV+M1oodPK2nfBDRfju/jbJvCPKujWiXp6yRJ5WCbQuWyJIcETQMuP
         OT81GXu1GMG4ocHV2+JOEeZn8CnnMhyJvIb38CQ80/glvnvYMuPIUGLVASKwUkCgBPpX
         iTjbdCx1Adf9OD5fmh+nske1/yJOVEimPWY8O5qIAShTOaPEnZba8xmHBquVn6zVQyjS
         EeOJ1G5kwqdtvXAqUwEMHLHRREw6tQ425zTVD7UqhKezHKl1aEd/qG7iBvFg9dUKifnq
         7naOXyFmqn6cCPPugThDdNY68cu38VKbRdMTct8n91ufonYdGhp2oBBkPQ20Jd2N4I1B
         uZYA==
X-Forwarded-Encrypted: i=1; AL+hErGk3qOtt/qwJm1r/15LTLu6QxlF90ae+rNe1wAWWBN3BKztTkIu3O8E0zcF2S1HMTDJ0TYLixzYTPsAxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+35p38S4XouxhOUqg2g1HTaVWecRrlyQp+WmVpyeC2hFxJOXRC
	WtrWy2mQjSPFyqXesMfz+LbH5WIyzJCwmsZjENJ+wrJHsNgb7qeBBUMd9HWFILdaRbrAAhimxa8
	fntgkTBQBAaYXeObZ+SC+VPsIuLln2No6owRZTmdw6bI3N6Rdop6tgDBRTAmIybYh5kW44Sfg+e
	U7+VXQntSWDid541fPR6FvHwszZ5YceNoN+MTdDbr+
X-Gm-Gg: AYBFou0DNsKo4Hd6HNPO+AX39QJEk/snTaG1rMGN8f5lznXZnvlvcnRQczaIb41wFHx
	M+F0jrYMJ41eouBDUtjVoIEwPMUsaGzXGTNmB7N74FBQO2HsI3qqHx2scwRhmZanDnpulHWOrWP
	8PlR654zAryBgOPhbTL5UPmluA7SQbE8QYOIanaGwYd1zruK4dbzkAMdwdmpzynsGq74glt5VrC
	HX/zXG3QH3YIlC4QA2bYJ39t0gbP/LaSfwe0RD0BwvWy8aVmkQKNPXrGNai2jBGE8m8b7Kgj0lJ
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id af79cd13be357-949ba8236d5mr338132985a.2.1795163469956;
        Fri, 20 Nov 2026 00:31:09 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id
 af79cd13be357-949ba8236d5mr338129185a.2.1795163469416; Fri, 20 Nov 2026
 00:31:09 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:30:52 +0100
X-Gm-Features: AclHuK-2t8-3AjSOfc5mzRVYC-Pl0iOAGyB7DrYCV7YVpEsHwSudVmzm65JQBp4
Message-ID: <CAFEp6-1HNo5fJ3k24sM_Ed_WsrrUY73ZHz3+ZJwa1S4pSqQshQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b000550 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=J237TlFOsQyoHL5R2bcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Kp4aKl1YurmC73LmGIz_fA-Bz0_p7DRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX3UJkevyHe5a5
 jitJxbchsEswDjNR53Sm/9fRME8/YZlj6lnEod/pN9ViwQxmjuh7gq+5iQHbVTy1Ed8YPTXSxPU
 fDBV9TohRe+aAjmDINdYmJYsjx8XvpgNzT/wK+DfzWUprUMDq7A3GI0j5KaXd7LN5Go2JyK5Q2k
 5V/0zMZOOPuSM/hsrlEPNiEsuKuDJesGHkhhsdr8gBpklkl8m3929TWBp2QApM1l5U5lkrvlPCb
 ds0B9ro7DibcwN8sJirZSXS+KEPEX+kZR3gSN9KQogNmQLtWL8ozRJZ431KB7D0mXRgwENgxi7A
 cwJfGraiOKRorXWkE9+Su+sweId4/gssx6cviiFQf4lYMoX+tzupWktGfZiGGt50jNSF4LkOir4
 xAMV7pnMxt0aLowAR0A1VRWQP126pBIifEQRItv6xo+3h0OabjLuK4VCoXguPoc7p88Acmamfrn
 2e4i4wzG8Q0vL+UWGpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXxXX+sr/kDDmO
 9AtC2QkXuBNk3kh+dE9X2482jK3unn7KcQRSSZdh3JvQtbrEuPDllLtwtD1P13lcVvUEVo5yeGL
 TF64F7hKgzvfqnI28gZpOz7Ivm+wy0o=
X-Proofpoint-ORIG-GUID: Kp4aKl1YurmC73LmGIz_fA-Bz0_p7DRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200033

On Thu, Nov 19, 2026 at 4:04=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
>
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
