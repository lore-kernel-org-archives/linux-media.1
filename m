Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978B3DAABE
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792679; cv=pass; b=dlFzHv0fOnSxR8OO20tQf2BACHIZZOSzZy+m0+9f3zvAGWIx9JL1GGBwOozgms8qciXHpV9Bqj9webnbBdbEot/6hUNrGOsbWE3cjDV7zZLA7frFv1R+t6fWAM6I1Hd8a3trcMy12kIOCZxJZZ5iTpWEU+Lr1L937gXT/6/umFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792679; c=relaxed/simple;
	bh=w3y/jyFFCTw8i+47DEKYD3ltrovK4xEt52qH7LpTfHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFaWb6vS7wsaI7k9f6GalswQiaqO/0GzPnIVy1kbaftaBnHAl+ra302JYa32BvkEZJ/FvYbutHtr/ktB+01EEv+AAMDdqMRLrR5I/CtTxzLZHI5ziXl+gWbzlVhCiD1NrGuYiXwytEOEIVkmjtHH6XaGLf8eEVIcO0yOtT0bbgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTvLJ8zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp40Fup3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTvLJ8zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp40Fup3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bcd53416133
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=; b=PTvLJ8zEbkyv9lYa
	zyvh8Pd5xDakwYRCQcXAy+xtt6/h8JhtyWTJDSmVWb6/U4SzNwxcCc//vD5qZ1CM
	3fzs0lkyAr7+yhA1YoWucM/ptO9sGVXQ3ZT0dW+zAyO9rGhwckoH2UDmQTTwd2+f
	8lFNSJVbRnMkE6OLPMdkc3Cd1uvouNr3dKdQQjRj5BRHJCF7hcFzFocl6X2NlUwS
	7Xkfquy0CbwHH84mwNw2Uos2tGZtGBfu9z2XLwF6/mjGBBPXMvJeUAju2SJlasrT
	7N0BvEWNZUgLb4YLNBBbl/fo+iAyvwG35RJ6QM31xSAtGabJ/52k56FtPLJgx7aT
	L2Z6Bw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7hv6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:44:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso3613891cf.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784792676; cv=none;
        d=google.com; s=arc-20260327;
        b=jGggV9xieYPCTdFsq1apqNkJR104SHOreHMEpup2FUJSW77zLy97EvrRyUyFwrYFG5
         /MyoiSLY2FeLHM7Z39vhX0vt1f3FaKf6/zzNmxPs3U3uGpulK+75fMnPKnSzcHcbQeb3
         VmvlwaCJgPxxWK0S1+pZMEHy++CGLRunbYSjIsBHrmii66qU17QVN+nVBjNrFi0ER2s5
         kL7xsp0Dc77+1PfcemIldRNlEZmv+nuvQ/qI6umPvLqBmBEN6k4cCZt07Ic1ZS7Gow1f
         pJFkAOCZtkLD6l0bMrKwDxfOFJW0kLGecXgQ00WrXLe3UT2RnJLFYzJ21LhqODKzFWwY
         /OIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        fh=ct1YokNJGa/8PEbnARFeeeWlf6jgzsBwOnGpUNemihw=;
        b=TJaNMfOhRCl8cubzIRmhvWMY+ujCHy7zHXOybUYzZKSLzxk0W8EerX3HI1ftpWCOhE
         JYn3agEA+aWspx3CsJ+2/5SZTzo4YEqwyJso40EElMjHRPqHZtGUC+/MFJ7WzNmnr2yr
         pulSgExyvemvIr7P0QHcTeKtyP9r3pbqm0tgFdHm2zHVdYJVzwY06cSelPW1etue0QRk
         W6Y+jexOvSwOZ6ppgas9sv7eAopB+O8BoGWVCTMjQlr4z1eBLXHu1G10FsnGNcOTbleF
         88TYgOeHpmUEv9Tu9ILfET5MlM0jIH6L3BjBTUaNe6dmW3jVaIIZEpT1WRvnZcTb73PO
         B18w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792676; x=1785397476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        b=fp40Fup3BLomOmQ8tgRH8bkI9qlFBf85eShW8Axnsx3E6mA6KrVhIIK6LJZ8+b88CA
         yQ95n1Knwp6n8soGvJCaC3ux5b02rSA04tLtU52Pyd4iFJQ8Tocm97jjVUC0TSyMO0TC
         bbtjja2eKQI2hQuNCF8Ro0iZ328YO1VsT4IVlsai1insbdgWmk5oT1AdG4zJag2rR88d
         KywRejAUAShAYDKRXKwUbEklaSBnzOitUgUb37MGonoC1wOyaXsa3cHqiN+h8aj2SLcY
         OK+2ZQAxIawxDCTbVoPFEeOZRr5WAPnmvx8ldwLVn198ftaCqAVJiAbxOrnTGxbJYsgf
         0l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792676; x=1785397476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YqJo7dqRZ9yGiorjxAlzpP5wqbV5V2U3/kONrUg6zI=;
        b=Sb16ycLJ7hPp1YH6at2GpBidoX1tg653mhbe3P0BMlb6clwH8E4F0T5KaWJrq3RIRU
         gREIQ9Cyqxdb+p/HipUxPJbC+tK9vOoTIwfFPJEMMiZeF23ICnT5vre7ninckyDvOMz8
         ZjNq68Te/4dnBJw53jOSjOPCyOZvxnUiOgNS+zs2fTIYAUtd++40rJqY5wz3nSRXITQR
         EBERgVfMMHA25CqW8vi/43p4ffKhdgMRznRmtByVpyfOd1ZC2n463ad+48FjcdVmX8kD
         Dld9IO3TTG1ZItRyu/5cS9nqam/q4QlZl8Wi75TOV6BaVmpJmwYAnj5Xfu+1WisojzAt
         gOsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKwKzHMX0FhbymJhKdOKrCQQIpSSEvAl9maQ4j7MYLkUEqpaWY4+3RzME/82IbwdpQkgdZhlEgqnKUbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFfPXpmxgwGQaz1n73BdAt1Y5vqUKgHB+c10UiOSM/bBO+Ep9
	up6tcfF1Aem6sFpjKCyU0xyFpeRVCfUlIEHSyAPaD96w5kBdt5z6i7Y1gTV+078AsMt5/VYpnvH
	bI/8UlHQYpPEwrmp+LCwz7kWpLtn+cZztx4cXlRQQ8wnJWidPfOjYYUIWDeGXS0JmghedQE3hX2
	PlZnEfo44sI5rxaEnyL1SASvOZegC1kcyTIJ0InkVh
X-Gm-Gg: AR+sD10PremIGQt2RVQCYVA2yh1GY7PxSe1zzp06NvE6ufBsh3jSWPxeL5pd1WDOYrw
	VK3zVaIVaNU1rPHAsGr7jwFhSNUVu8/yaVt63qpeQY8X9Z7P99dxZzOCF3RrHpXNdzN4PTXI+Cs
	1T6UHPekpx0j3Vfr7Awu3Rf+vsWnHuDWVYlDPITm6LcybRiciaBKh1Gc0a0jhMU5rZpWnD7k09q
	lEQNMOfap6Y44vm8gXav4sy3WZlBEhYLqRXJPrV0ikc+tyF+cLtsmiR2moKH6da2CgBwUYENP0=
X-Received: by 2002:a05:620a:6014:b0:915:92f3:54e3 with SMTP id af79cd13be357-9310468b3d8mr135742885a.4.1784792676510;
        Thu, 23 Jul 2026 00:44:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6014:b0:915:92f3:54e3 with SMTP id
 af79cd13be357-9310468b3d8mr135741285a.4.1784792676034; Thu, 23 Jul 2026
 00:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com> <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:44:24 +0200
X-Gm-Features: AUfX_mxHzk7-ekNxrR6YHZYSOZCvGJXFcA068sPkpn4S5C2k4NBZwk69GXbglpY
Message-ID: <CAFEp6-2L5vjGXLGCgyr14hO-n+4bv7TfPQUwfGKr3=2x-jmKyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cYb7Gx-GLuF_1qX2UBX4GqxUgBZJaaN0
X-Proofpoint-ORIG-GUID: cYb7Gx-GLuF_1qX2UBX4GqxUgBZJaaN0
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61c665 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Pud6JYmB0RDRJANqHoQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX/SLWl27HQhsY
 0UAP3v1wUcAh6/GlJGOv55/vVb8AkS18DLnaz38+vQxHhZhNf0eVaXDItjo9+33JTHhNIpOvVJT
 yjqInCrCgc3irkLwNVZkbNU9tDjFs08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX8vR+F+oV7QnU
 FCNqvhdTh/LDtXGg5KMpIgkCcYldLjU/0u3eOxbnwfSclA1jLZN3AW7lHzcHq0FFGwG38wOdx3t
 Umzva2yOaZeCBU587U94uFtxRg/Qp0eoJSP9irigfkHLLJVOWaX5bBhXqCnvdF2OeIR9vee/KSK
 pFxDC1spXaKvIPSOETzy4hAr4tUuQ9KbhU5Y/ZvIYDnEuWrR7QR9AhyVJA6Hd0UDkIUaxyUmbXR
 hCiZ62iihZmJ4vxKVVcOXYCWxOf+SGro83w4A2XWgL7NtNwBK5AWKAZ9RQFVUFJHDFecwMV6qe8
 ELDTGQwsGutcpqoT8knXyDj6mIQ2/E5zuL9vJsSksQ8QU5UomAPf8F8C9txsqx2U2wPfCPOZE+N
 lZ7y5pf0nxjxdRFWaqzEAr4uqnwJ0hS5D/hiFTzIMbizkYcGCzdMrMheYxg20nUlIyunCjsOX/m
 3m1voOKDRBRJq1JIeIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230076

On Wed, Jul 22, 2026 at 6:37=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775=
p
> icc resource table and qcs8300_resources already uses the sa8775p resourc=
es
> for most things.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 3efbf2fb4472..477358dd39fc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res=
_8775p[] =3D {
>         },
>  };
>
> -static const struct resources_icc icc_res_qcs8300[] =3D {
> -       {
> -               .name =3D "ahb",
> -               .icc_bw_tbl.avg =3D 38400,
> -               .icc_bw_tbl.peak =3D 76800,
> -       },
> -       {
> -               .name =3D "hf_0",
> -               .icc_bw_tbl.avg =3D 2097152,
> -               .icc_bw_tbl.peak =3D 2097152,
> -       },
> -};
> -
>  static const struct resources_icc icc_res_sa8775p[] =3D {
>         {
>                 .name =3D "ahb",
> @@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resou=
rces =3D {
>         .csid_res =3D csid_res_8775p,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
>         .vfe_res =3D vfe_res_8775p,
> -       .icc_res =3D icc_res_qcs8300,
> +       .icc_res =3D icc_res_sa8775p,
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_8300),
>         .tpg_num =3D ARRAY_SIZE(tpg_res_8775p),
>         .csid_num =3D ARRAY_SIZE(csid_res_8775p),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8775p),
> -       .icc_path_num =3D ARRAY_SIZE(icc_res_qcs8300),
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_sa8775p),
>  };
>
>  static const struct camss_resources sa8775p_resources =3D {
> --
> 2.55.0
>
