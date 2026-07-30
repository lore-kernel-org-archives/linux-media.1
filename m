Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A199414A1C
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405027; cv=pass; b=nVKdZcbldXwu5Wh9+GOPy+YGGPSfAI9yZ9HKBnJ1ZSqHdQp9pPTSB2V03CWDAC8U06iUympEZbksEL8l/csq7leGvGpUl0vH0ESAZsZGNbq2749wMMh00SxpICmSG3sINtbBRNrz+QDsKr3YltmglLO+Y/BLS9mDyuwAzTP52ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405027; c=relaxed/simple;
	bh=A9jdqY+oDMT/5n0+8GpwwPmzXAejOOLdJI8RRmOYi40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrwqZ8LTgzCDya+yjRKfs0mYe/Wr6FJMWE57XoyPmudEqYbr4NyNzKkIr11wvucjLyJYfJhMf7aSvRspkJV3reWs+bv+iIE/3Ux7pjht2rNwygzgViEH7udZwx9ZDO/ShSutuoHK+MlGUofw609pq7LrV50vjb2Ri+rRCRXwNEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q65WonDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fr+HT78+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q65WonDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fr+HT78+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9AGRa378516
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=; b=Q65WonDzHgERcEJU
	azamHzBs+gOA7p9DyHxr3UaMle5X0ZGsDVVWgo8nnl0uh2J8MD9z4sg/D61iVaTz
	qn2gtHZR78RcPRp00DUlAhmrh1NhxKdx4eLcNJB/vcaa+Yl5nVBww5MSgroa6mu4
	vtz++WJeDKQYYnz2YHdzkmy17VBpkQpHuKjaNgtvtG32eUmL+1ZEpoAIKwag/LEW
	+k07iBP7hJsqm8nzPskJvYlZWMcI1N93PK6I2MziVAwdfzu78MJULh1GpgvYshJw
	lZvwx6XdfUSZcYqOUaSirdjBM4RsWjEur61Q1pLC9hLVF7DJZBFAZkZd5z2HVX36
	bMUCJw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3rdg5rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:50:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so20331156d6.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785404969; cv=none;
        d=google.com; s=arc-20260327;
        b=D+8ax3PPrZUKOAwJXyYWBX+pDjtlpCP5NVifl/vu0Pv4shLN/5c86wl0fF0UYvvyBN
         yEV9MbDLMG9l/OFHjtIYSkNkDNcfv1zIxA+J+BeHENoDkoXw8R5WiKOe8MuvQ71oH+Ng
         5lc1AVuFHqDPLKhATBbGGvtOumgXaUlJT6DKVybxksNldXZQ1t4CPjd35N3s58m41wUh
         ewBaqSTI6U19hUgksZdPmZDcpu2qN0Ylim2zWZY1WlM6cRrxXiT9DCoPibjUy22XBGZl
         sTXYnz6sDNkgi5nReAxjgvToD9cRAJKp7UxyG4Yiy/vmj/r7ou0EO0rjDWXk47/JpmTz
         X9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        fh=KYwPeQbM3V0tfMgd6WXMwRk1vvpPqkA7QcfyeT0UNmc=;
        b=io6u0A9TMeK1s5NIC+XKwOmg1odnIlJpRa2eq8VhlQfzK2RtkJPkPUOZ6FV/qI0P2U
         bwEhI7QbERwXbuSc5538xxMmLwSXXnF2CGoxmyoWRCXsbwn7on6s96hf2wi2HTdmkACx
         yGmcr+kHAXSVlOOxeDquW0CbNdKQYPt6cBNhhqmhJql/YwCiWptzeVLe3H6ppCDIVn/R
         ppyGdsaDKI+pgNIKNS6eLIa/Z3jBf9kqj5GqcKOLEEgtAG9Oy+GBoTu3/PzSGq7mtYB+
         JJyacPtjGpqNWsG//Fyn54MWReIxT9NE/Jlw7JKFucvYPbR/1vCv7Xauf7RU8haNRxbx
         vmSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785404969; x=1786009769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        b=Fr+HT78+ZRbRxokxQM6yWVQ5GR9JMXaN6rMCJxT9tUeKOkYUdhsepc+v9GdStfMj/a
         1XNxWKFxxg72LpdJ20EKZehhELf3IFeEWi1Q/Q/a6/cS+k8fXYYtMZZch7JyY+4bIyxP
         EBABwG3qlJRSEzypv6nMXyN6skQzMQlo+rmVy3E2tdMPhS+2U+NJ1pzFIeEo4CsCP9h5
         D+3vgaMEaIHYqyyjm/n2k4I9CKvTdJEJ5s9NsvWpz6V6kogTE3RxnUpVb+u3uvEXTUlT
         tYS2u2ERQx+g6jAa2btLeL1nIbjtu2eySDd3SoJJKhZifHUmdM3af+JouHVF6qnMdy3Z
         inTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404969; x=1786009769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        b=ecwSQxHpjwvROSBf02ouwacO+csSiC4dw9rZ1NDrqz3k/fwKG3A8ARnt7XuuvSqVCs
         JpzwWMGiF89d3b637dcGjah5Y7sanz6NyrsHDkQfA1dm3fC7lB8X216h0kBLJnite//1
         2QCganKm4xjyQg0Mpusiprt5+rNH/T8lbQ6bUeP+FW4jYH4rgY5lKVerd/qXdKsE1Fpm
         qsMqsdauBxfdDCurZ569uMTqtQXisjJRLRcRi0CA4BsIGLyXX8aEa/n5h+GdA+106v42
         Yd1XXGb4SO/o1bufjFICjyJms+z0NKJW3RWOK635IzZdxgwNMAKon1mjhW6I1+4zcgPL
         6kog==
X-Forwarded-Encrypted: i=1; AHgh+RpduPpc0nzcDkTVHgNKB3yQH2uxFZ162mZMCMbYiMml/R3Vr5L8BNOIIL22Ep9VtmmXBfN1iYxk846DlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxmUT5m7ejEQsDxw5OhclnKQ9eGLExMKsWKQzdp//jk6tVffmh
	JvxZiktCKOSoz7UApQ1gv2k7d2HXfsN4x3PXybYaVJCHfU+sUd7qnphSATfiViDSQLVG/2LIAId
	9hDhneb8XvoaCoQRTDrY16gOcXv+ycv2ZLaSc/DqmLrSg+G0s4jUO11x7tkJe9dCBxe8EMis7Cr
	2UN0QjlafOPSg2YPpLTPNgtVAM5P59dumfSBtjmLs0
X-Gm-Gg: AR+sD12XR7N6DeHSd0FlKANbzBw+g9E8Au0pM8Utl9a8S+J3bxw8mfFDOK6hUcEFI/r
	graJJ09HT6w6DG/SSyOPRYICa+KMQOp8u2dhb7DSBMqTMxABhZ6SgyRMmDBdA5Dflafw0n46o3p
	LIcJbiczU8t/ALXVWbTvGqUDMB7jfzsvKrBvsD8KMnOUU4G7SS7dKRPHbtio9V9Btzn5XooCkya
	WptKm8SwkB0NnDbdYcIx4zvGk+i9TuqPLQr1OfO4vN/hS2G6Zb+t6TTskDgqFwQUfI9IkZcHKo=
X-Received: by 2002:a05:6214:48c:b0:8fd:6de3:bba9 with SMTP id 6a1803df08f44-908347efcdbmr15638486d6.63.1785404969189;
        Thu, 30 Jul 2026 02:49:29 -0700 (PDT)
X-Received: by 2002:a05:6214:48c:b0:8fd:6de3:bba9 with SMTP id
 6a1803df08f44-908347efcdbmr15638256d6.63.1785404968729; Thu, 30 Jul 2026
 02:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com> <a880d399-a39e-491f-9724-c892b1a7ac5f@linaro.org>
In-Reply-To: <a880d399-a39e-491f-9724-c892b1a7ac5f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:49:17 +0200
X-Gm-Features: AUfX_mz7-ZjDBBfZ0z2EuRPW63loH5eyCJF-yYVYlhxSwg9q8-PKb_bGVa4_e_w
Message-ID: <CAFEp6-0fk+-jTNEEV3+CgmnxZ-CiLH_FWg=gm_GMvURYeo390Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: swYIHOgg8zLQgElnX66xLPBNJOaoiGpL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfXzZs/0GjxkHaf
 O5puMfKHt/tau58Mnz2AUy3QTBRQNKsZ3Fnrd6u8FoJBnM10rJBwMfckwthHPzjSmBYVvh9I1/r
 phl3yvHVR79YWY9bCTxMjnes5X4kfB0=
X-Authority-Analysis: v=2.4 cv=UNjt2ify c=1 sm=1 tr=0 ts=6a6b1e53 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=b1Kfy-uXUVUZEzba4ngA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: swYIHOgg8zLQgElnX66xLPBNJOaoiGpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfX/YritFf9sap1
 ieG/oqFr0YTiD6LxFdQRwoNQ9OiFau7JZ0EJeyDM5ElZg++//5yvbEf9x2u6BFZQO1pe31Bifaj
 ALgI8e+q+sTE+OrwTHI0cllI593dcsxAeOze8SEb/2MUZP/OzeBZCUawWtKBIq9TD4zewCpIIoC
 /z7r+M4nsEJVxdC2L870K+KLJvmFufNCuDicDq+D4cNkzybgR7iy0//N/fQjOj/nsVe+6bjIaea
 vMXfk0ndHumbynWrDP6Gv4DNL+1RuYz9WTPLq17ZDRcpuVDF5X9J+6mt1f9wFWQmwmcd5jLh8j0
 1EHUnToRUSUfqzy7t8vsmfv+loFETiFm0rncsP33Bc2HGaJWjPv5vfq8vpIdu4OvoxM4hGEVWiq
 9sFCJZY8cfUw3wg/jqgn/bHZND+nW0ZWenMQkGH62N3N7O7Weseigw4UdYoGuGARZkqofLrar/r
 rQeWWJx3YjRDv8HlqRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300072

On Thu, Jul 30, 2026 at 11:35=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 30/07/2026 10:24, Loic Poulain wrote:
> > +     ret =3D devm_pm_clk_create(dev);
> > +     if (ret)
> > +             return ret;
>
> !PM_CLK this is an -EINVAL I think.

It is, but we should probably still allow to compile-test the driver
without PM_CLK?
Maybe we should just add a 'depends on PM' since PM_CLK is enabled by
default along PM, and we functionally really want to run our
suspend/resume callback for proper driver behavior.

Regards,
Loic
