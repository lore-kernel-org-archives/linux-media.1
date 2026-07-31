Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5E3D9DB6
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486683; cv=pass; b=YdJfc5TjfJqMEYuJrcuSEQCMUqMTc4dxVtuXbNtusfyUcbe8GZD/m9tKAWAYAVC6EjALb0Ug6NEh0hF+KxXpYOclH49hHeQDYDUqGJUM4pGClGhrTgiGml4ykVAGK9LqQPn6+hK3ap1C+eYH6VTQbvEmcspM9shy9ECKLSv3mO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486683; c=relaxed/simple;
	bh=4SOPzjJOmNN4NKbTTedD2W2xht7x4CtF2UCYiAWozjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPcFTXn2OCspEvNiCZz1JS7vapEt6sCYKUJKJ/+hh9azzdEJhtSazcmwdDDgmyzMNSiv+IjDbu1PHI+nsLv5COTmBGa888WXnR/jfyo83JB46Y784JDPveh9vn9AbHjpa4ReQY46bjxDAdAED4JmplsbzwxKt9HB0uYs2rE7FP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMA1Mxni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DecPPfDv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMA1Mxni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DecPPfDv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8U3wX2955849
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=; b=AMA1MxniyZT/Flow
	UzWFeDU33q/mXhj+Ahpd2uOCEX5vXqQxRu/qiqAbvzmgJtTxvqqIKR/EVAgo5bdg
	VmUYXl+64xibnLDDL5TKHO+GzJ5SdxcxN3VWaLs+GAQ9jKiB8StMu0Pi+nACQSYZ
	6piIyRF6slmTC4f4X0TGytuZvCI04jXl+ghtbFU8TGHsaEy3Y+GUFu6sYXqvCEuF
	9BgbkqyfIA0S+VT0dDclC1sa2vRqi4PAAqsm7+3oe0U/6PkEDbfSqsQOxTiUzhHb
	boygPMpgSOTf78r0xfc5VSBrrUAnaNEGX1/GKdzEzGYSl3qKhI1usg76yrjOdDo2
	6rug4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr8jg03m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:31:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so89503885a.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785486679; cv=none;
        d=google.com; s=arc-20260327;
        b=ae688XgXyUUgiyvqgPa+V3AmX8Qm5dQT6OxIloQ3PxkdszAg8chLL7z43b00VUUHXm
         fMQnYJaGQANfqrt8/p8WrF61U28+aofX4A/4VbHlBySLek7KYW7zIAqZARIrFOLhOEsW
         7T0vePrZQqWVDFmsoB0HZycMpwzjx3WuIZx5iq8mD6hp9JyyiOyOIIA6KLSAfitQ4QuG
         Pl7Uo1BphkjcdLnI8OqmZoqrqhv2FXHAM/ThCBL8gl4UiCRazEE7eELZri6r1sreIxwx
         FzSB+O1vwKpQ9LCb66iUheHfj03S3q8HQ/WuDmemrkVfV07yH7fQ5hU+4vmb9a89QtDl
         IeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        fh=+xRSXkwUQN6VoHte5o8kyWoqYpGZ4ibyMx5b8BgvFUI=;
        b=pIaci5QewJBnaWJB2h3/oESyGwPumzCL15GvlbPrID8bH46uG6hl2XxSbgboEOpn9E
         79pd+zp/ep7NayW+fXzj1/nhAziv2tUCmIVwJalRYeRtkimZEkCUFprKuaRAjgIf5tQr
         r4cbfINTtDKLjUsiTbyvDYuNCtgWTZgxXsm0SMXFO2S8bVHIhsgj1BDQtraGtv9hlQsG
         GV8vIGBDOcBEQdgdfMsV29/ujmibLoqDN44rvR7BQgxcG38Pll4QdPaLv7MQQ6B37lrx
         ymO0DstHGoH6kngQngIjPhjTU/VE5FpJM2rCVBX5ilPG++tGD6B7UKOobsdkkjk32RO0
         DxVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486679; x=1786091479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        b=DecPPfDvHnfSd+qWxbfEA1goHPMGnBHx2U9RE9mAjy0sjy6RflmpLS37l2yH9qBqZE
         6noLgZcJCDakbXINHWaojX/UeJjjAtXsa+WdG/LlZT/7L0LTjjvbMrFik/68tsUv9NUG
         ubyMV99Ju/e+oPMkRyUP4Xs0NMIcV4y5NVEq4mRStO+cvm0OeHXp9NMsvwEdUfq0tvRh
         aL2/hRxbUh8b/JtOcIY/7z46d9OXaWzOPudofvofN8r9zVHi4bH+Qk/0BVfBFX3F3EUF
         cvaCBBy7ACN9zwlUiyHdmMa7qEoocGe8W+xOlvUytW37SP8aGiV4Ir/KQjoKvz9eICdh
         BVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486679; x=1786091479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PF+BzOa+IEPMI94ujDEgdgKxG+Ci6qvQzzYwlxof+Do=;
        b=GdxZQvjVUPMHz2tfTBUsQXQ4IBGgD8VAZRIjKQAXY9R+O/Db1DboPrMfeP6GLGdQyr
         Po863sY4u8t0S/QSsWn58Kn34lpa+ePo1yZp8KsAjDTYnKFovTDSZX8V6zdtAAmgxyqk
         KbtsI2Utg3ow7OXFVutPquCMhA45OTYog3JWw3kHVDKmmNl3e/4Ts828tahWPzm97wU4
         UN7COaXLhZmvDzcJUsBE02wtJkpSQhHksVwHgW8nQOHCoTNHX69BuwNBsRDJmWZOsr8V
         ck3HOK3shkcGQLRier5E920fGwovElzUTSs3CvA/iJ0m+UM6jpAAFBZNzJgRobjwPGtz
         Q45A==
X-Forwarded-Encrypted: i=1; AHgh+Rqk+MUcPzGwuNLckdv5P8GenhQVnlA/rukGuKHMtwh+k3G1e4ozwvIpasgp7BAdx2eYxxFzLmGSvWsDwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrVD/hymiDq5bGLZbN94RJU+z5wt8w8mYhdxCbm99Bk3Bw/I1
	EX33avmZ3y8GVSwZJAXgd7w6cZ292d7MyBTjaLs8nxZuVgGbgU4LtPfqDI8QO6VgCb/9qpLmVy5
	m2Z3aUM8BFyXuJMQpikJUSVU6YNxtFU2OMiqzfWTLa0CZyeG6dv/yeE9x2Sjrt6p1HIx+XhAEfC
	x/FNhB5oGYAlS/ukq+QxIZo3VelQj4GvKJG5SBs0E+
X-Gm-Gg: AR+sD10+OZQxMFidr/OayITD0HmE8wKc+gRwXyZX0NrrPt2yJt2f94TEEQuRzsFN0Bs
	lc/4zcPTAOnHyYIrXBfy1dSN2oGnroHDLl0cFt/U1SMC/by9XVmj4eIBkb9O09dxsSMRpdIu+q7
	IuOi6ZtdV8Y/zawM9fLd3S+hacwWl9raM684eEGwbre9c058Xj/u5x5PuBgkm3ISoXI3g1kCqqC
	GFsPSSAD+KSYk+Ekx6Nyx1i72nLhSh34Uzgi6VvhZ0TVwYm7e+1UUoVMzZGgSZ7ui67jCJIb0M=
X-Received: by 2002:a05:620a:6cca:b0:92e:de8a:d710 with SMTP id af79cd13be357-93496823987mr129847785a.47.1785486679241;
        Fri, 31 Jul 2026 01:31:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:92e:de8a:d710 with SMTP id
 af79cd13be357-93496823987mr129844985a.47.1785486678704; Fri, 31 Jul 2026
 01:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com> <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
In-Reply-To: <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:31:07 +0200
X-Gm-Features: AUfX_mwdmpbruSgXCkaRGtVeIDySdEgLb1f76KIQTNgn_MJJEbwFXpdDDLuv_oE
Message-ID: <CAFEp6-0fa-TwcyHd5aSRdQ_ioBEFg+YvjDz7kOD2eHphqJt_yw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Bd7oFLt2 c=1 sm=1 tr=0 ts=6a6c5d58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=zeSE1S4S0imvIZae8tIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yWsqU3vAbSf_ZY6eTJCSoEQo4Vwqcj8W
X-Proofpoint-ORIG-GUID: yWsqU3vAbSf_ZY6eTJCSoEQo4Vwqcj8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX5LbjcegjVJE1
 PKDD8xefXRak8Ks29fntitXO5iFbzwRqQD5PA0s2r4JzwzBv/a+NcADITN16YxY10TtogbGMWNE
 Jul3pkKHqHU6/uUtlUDiTn+iGhtrehIx/rRa46wq9w6FQ2FA16Y7eWByol1BKte9P+s0M/KsEoU
 KSY2ov0pckjzf0M0b3+XNCbsShmJCaNRUUW1GrC4hS9oFQp5Q5V3qUZOd8VewASuXkLRI0LnHSD
 3o2pDrkfbwBF121iXli2+WdmKBw5JPEFIlp5Ssn8qvcJLiPsp/fxQpaaQ3HlcX+ruR764CEUq9p
 ZSzb5jnShxHU2rXdoPnQ5QqLo64hqaFoFZyiphCUlcXQUSiBNlgT5fkbGp6cQQWmQnLP1qKPpmW
 OPkSsVm8AkgswBJxd+Oalt3KcM93+u3HbY9/mtYUOfOTQ+xaWhGiq8FtIld6OvlwQZ5iui2rMGz
 oDUkzzsGJKNjT1undRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MCBTYWx0ZWRfX76doLqaTXklU
 /ubL8qCeAkkOEIUZyVvhSjBAYLmRtPchENV7oz97vVSgHOKQ9ZgbHI0AFUdxsA/2ymMdAVRSPp6
 7q2mptSvfAWW2q7jRFlKaLp/VK8ghyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310060

Hi Bryan,

On Thu, Jul 30, 2026 at 9:34=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 30/07/2026 10:24, Loic Poulain wrote:
> > +     ret =3D camss_init_pm_clks(camss);
> > +     if (ret)
> > +             goto err_v4l2_device_unregister;
> > +
>
> I don't think this makes sense if !CONFIG_PM_CLK
>
> ->
>
> I don't think the read routine in patch #4 should happen if
> !CONFIG_PM_CLK either.

These clocks are required by the other subdevices/blocks regardless,
so they need to remain enabled. The simplest fix is therefore to
handle both cases in the initialization helper, use the PM clock
framework when CONFIG_PM_CLK is enabled, and fall back to the regular
clock framework otherwise (which should only occur in the
unlikely/compile-test event that CONFIG_PM_CLK is disabled).

Regards,
Loic
