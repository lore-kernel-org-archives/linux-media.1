Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991277;
	b=2poqQFD4vT6uLB5eEvEOpH5nhFP40wT5H0etDUniHEwD7QV/cTB+4awHyqFR44Wzv7xG
	 IhxMJXsGdyX5Zenj9xPqY7xVn7e+M6sY4Lk/HH//esyHD5lA7JGBO5WshZg0Q7rc+1/sQ
	 LMJRer+GudX2ljiDFWl6HKcF5wu69O//fM5zL/stpyG8SqeFvH88eXeRMpI3ldCDsYl8C
	 0x5lZYmt82zDg3iRxnBqxj9e986FizXSW3jnFnOZtUh1rt22USsJcVywgOzAeAQEWqCXU
	 FoiWHBU1GL34Muep+8kYQeYxwMg2Xo0wxdUO14lZ+UKJiw3YqzO7ANOiTwNsO+RQuEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
	b=aTaTEwOSn7RR0w+yJetIll51agToNKJ0jt8rmTRQu4h18YhO0bDSEFdkpIIgXRFIYYPa
	 /IASgFXW9NiRt7vcqz4RFDoX7o89CZnXy3figmjjc5rlc1p8J/tmCcnP2ViQT/mhTEu3j
	 JYCCx/oLueyK43B4G9Qsb60LcPW5w/FV59bOURh/K6w5/BOX9thEI8esUtT97b8Gy1PTp
	 ZIXMfT5z4w6Hzmm4h2/F8Ad9znPZRexiPiZSZZAUBeK7CcBMSXSN4goqOZ/HSwYpea+bH
	 g2mHOfUKfnOvv4GfjSqiQiz+Wz1NWmrmjWgGjoYl7cCNJ/gNZy3sgHhzR/PuezivpzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4PGe8a2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ59VjHd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67898606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67898606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4PGe8a2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZ59VjHd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8L4je3371238
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=; b=K4PGe8a2AJQ3QwHF
	PBw7MyaL2sGuePg+lipgm2fMFlFt7jULjJKMwU8Til/FsUoeZrCDA0GFNg+SnOH2
	wWwVhP1xd/5rGYL5C3Ar9pD/DNhvCKBI8yyiOftLBMrmDdKfN9P7whRMs+9pLOk0
	xOLt9of5pttOFQMZcUcNv8IbmfRqIckyijt8jc+Odw9FNIB34jLSbeH7kyqgrkN5
	gNmwCPyeQSDz+xuBR2BM6pGNJtU06SKJ43Y9QMAljuWZnEk77DaVz99gWahhR7N7
	dIcLxUR20EQ2Esz3fMBKOArKPXXcThRDUbPZKHCfe+XJyTuC272UgAGJj3WQ839n
	9l2eLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t34h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 08:41:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so165960285a.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:41:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991276; cv=none;
        d=google.com; s=arc-20260327;
        b=IrIPXVSbOmgpForjq65/oTuRA0r4OiGk7CyKMQ2txHmzNeynqKFXC2rPWsAqF5DNuD
         qEycZSFMAKUtILkHdF5FlKsT5IBFTlyyB6J3NpqRDFqOwy+52M0hUU5SgtOuQ9c909Wj
         7ibCG8NW0j1I9efR9/msY0qwLVO1VqhFd26xoeAWok7g4IoifDsERm8aZM2Xd6ggAC0H
         flL71KYuG8Fu6v0Mj1iKtawjjmzWEyJOi4YXLNouOlvZ4I3utTwD6p9rzyyAxFI0r5mS
         TrqDrPNMTrSHh873qZbcITMI400AnvCg8otg6XUBIKenuyHOYiSXoo37BlCLYdAwL5op
         IDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        fh=CaDaC7ffkrQ/+EaQpmJi7rkdb6PhVDwhouV4WPT8ga4=;
        b=bCeGgCoaPpv4VMU9oJX2le9+ba5x8+lWOBSKpHTIM2N+/c7XOZgEqcNTd+UPb6Sjr4
         wtF2SoXrQxMHe3fnelcqc0McKwhmT56EvcUJ1F2cYtbkJLNNhryrY2RbJf1w7E8mIGZ/
         i6ehC/c6cRHWAlXsCa00yTZw7IxFefeFeVprjjtNMjH2ZAxlWHILNV7u5X/KUf57fl/f
         gO6ipQwNllVAkAyQjhWhHM3ciMlj9Get3pB/0sXz3fN4FbcAuDwkGN4ZsE9l8T9o4xbV
         uGCixhmn4ONujOyJXPcnSgVipzoIrzNa4j3OAb2v5hHHBESVp3qEhVBVpfKELdbR372Z
         EJsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794991276; x=1795596076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        b=GZ59VjHdjPPNa7anQX2JHx8zSwuWgWhgw29x2TBI1/G0JxadwyzRfclAyTyYeerWb0
         dmzNfs+cpOnZzXufAxExwgHRcZ72uoUc8VnocUhkWv4aoj7FucOVlfF8c8Fum7UL8Cwl
         W/zgG3qQPyJPD3r1WKE/ETQlDMKYaGcVJbJB09Rlo1m8Tw0rMTjA8Jl4WSWub1Uv9ev0
         8bCHm8oyeEi8Z3QsfSpAuo3nVDt3TRtr4+zr3EMLOLUDCLcae2nK1teW6cQco4azdDY1
         mUx8U2t6+DwR+DC40ThkV2Ezaj6srLBGt49kE7+io9t3KXctPCplVbZUXwB7NZ3FQpQv
         Yk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991276; x=1795596076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        b=elxAVfB1D3/aVyOXdhxh/DSLkqkfCo2ZYtgp6cf1ttsfmYcE4L8D/FF31O/Mhbw+aG
         G0hxpb1pap7Xse41YQWM6qzQADjSIxxb79ZlDTY40xhZEfEPRzPc1A5gvqfwpaRapSDu
         PsASQ10dur3CWtW1RNiHmaySyr3kfEXFxjEXKcllSEHcvdsbCKCa/yZzVeY8V1ft4Rhi
         2LQbsL2FzKoHbwgv+Dv6ZEI0Iv2nOg/mLBFVgVRZ6CY2lx+9NLuINUPXU8rgIUdsivq9
         /lpIXiVd0Yu6xJ/9WLlopiuXFDoDe7tynInL3QtU6H4BEo8S2gK+amtGgw9VdKGMwamZ
         sL6w==
X-Forwarded-Encrypted: i=1; AL+hErHKX7pF8VRqoChiNr+YwpauT8EESvUOX7XNdBSEjOwceyCkx4zrl9k0XOs8KCImNfw/Lfk24Y5b6NXAAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9v3U2gNyDn0E6BreHu2gCnJIRy5VDzPqK3ifdk+CwYeD7CMiG/
	3qnqTqpJ71aoXqA711Ls+c3NKNQWa+pAFdkZdmOXKwely55XL0n9Fy0O7InfU4uEEjQo6G27Imi
	6gC6h2zX1idU8YgMkJwXQHoZWuO4Yg/pXn9QgptmFIhqWe4bAmFKLDscaz/IVH+638UKytnQA/B
	i0Hr7EKo2FXGuuTC79zQUNviwBAYtaSfF8kpMIR2FQ
X-Gm-Gg: AYBFou03syaUb13FwzSOoIJ+fKStsv7Uiz0AVZKcR27afZkUcAHRPsOZhtYAJFcW0/i
	ct7hEwPijG6qgNX3N5t8smzkFapfVoEA3qxrRPSCLtpZZ4ezFMvEuJZV8B1ueB8ELk6nOoNTVLy
	S80o3DrjUbv9/PYJ90ZzTxu7OSd7kW5hK8zCH/PQwze5hvd+aTNuFASOqvKskZT2EdsO45JWIEi
	qnc9huyLm0pM8o+b728a5HersVwvogtjhiYSKZadhhtPyV8+NKkmER6mJDoSUj2yCPPuG7nFIC7
X-Received: by 2002:a05:620a:6f0d:b0:949:7792:1106 with SMTP id af79cd13be357-949994af00fmr330545485a.1.1794991275495;
        Wed, 18 Nov 2026 00:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:949:7792:1106 with SMTP id
 af79cd13be357-949994af00fmr330542285a.1.1794991274828; Wed, 18 Nov 2026
 00:41:14 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
In-Reply-To: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:41:03 +0100
X-Gm-Features: AclHuK-asv4S0C-28UwXcCzwq9HUorGHrcOVKgqFhPzimzBIbD84VylDeLZBO7o
Message-ID: <CAFEp6-3N-iRjKXnQsG4mPGgafRQd5ZE-Kucf70dXye4Qr5OAYg@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Skip disabled PHY API devices
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd64ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=Lk1wFp84Q21arWboEzQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: m44KOY2hxM4_c05JeWrc318kvxVyhleE
X-Proofpoint-ORIG-GUID: m44KOY2hxM4_c05JeWrc318kvxVyhleE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfX2kifr+wIemtY
 InSa2Un2a7OjFGfj5zu4QaYvwY6LNAc+OtH84plsorcqU8LZZuB04cs9s8BA9T/+G03OhT5Dzz7
 +c+Sdmi7Ie6PyvvtpGe9l1Vzdo+zQYlFh5EBy2eNcvgfkh94DvLy3pRaFZ+wFSWaWoxKSRClszg
 Ca+nhYZONAOmEJ54Uk/PXJx0COnFVORGZXFEcvkAxsejP2H5Mxddjyf+q4VoyXn8/CygsYNOj+1
 lvWZKiIBfVI02UgCTKAdGh84ju0yqs2lAi4KFGCKQ2Uv9gCXiLy+k58RKqR5CNqIqun94sWRLbS
 rNukejugxmOMCpvnJiTYOd7qZDmWE+Ts+XfbVKzHTmBLneoNxN/n7x2kh63LpZUBt2+bzkQxkem
 3aq8JjfLkxaBTYa6uTiQ/cno3tvxwzmxs00N31vPmbSikh4BfC8p7lWWg4bvlSRMSqv+0OhkOEG
 9CUstMbzaIqBhhuuf7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfX+HB06qATE+LX
 CuvNBbTRt4jcWKTzBnN82P3KtspzRqL+nwdvDiOJQUtNzoX2TIaRePRZyl34/3tsnDbc5cV3vOW
 JeGZ0O3uLG6VIOK3iTRpZ+nzd6yH5Vk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180034

On Wed, Nov 18, 2026 at 7:36=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> PHY API based CAMSS topologies describe CSIPHY as a standalone DT device.
> The old availability check only looked at the CAMSS endpoint node, not th=
e
> CSIPHY device node. Since DT normally disables devices with status on the
> device node, a disabled CSIPHY could still be walked through and its sens=
or
> path registered.
>
> Check the CSIPHY device node before walking through it.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..ddb47c3ee271d2202228b089c=
3179d134b5836ab 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4745,9 +4745,6 @@ static int camss_parse_ports(struct camss *camss)
>         fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
> -               if (!fwnode_device_is_available(ep))
> -                       continue;
> -
>                 if (camss->legacy_phy) {
>                         csd =3D v4l2_async_nf_add_fwnode_remote(&camss->n=
otifier, ep,
>                                                               typeof(*csd=
));
> @@ -4763,6 +4760,11 @@ static int camss_parse_ports(struct camss *camss)
>                         if (!phy_node)
>                                 continue;
>
> +                       if (!fwnode_device_is_available(phy_node)) {
> +                               fwnode_handle_put(phy_node);
> +                               continue;
> +                       }
> +
>                         phy_in =3D fwnode_graph_get_endpoint_by_id(phy_no=
de, 0, 0, 0);
>                         fwnode_handle_put(phy_node);
>                         if (!phy_in)
>
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261117-camss_fixes-4f15a35a9f18
>
> Best regards,
> --
> Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
