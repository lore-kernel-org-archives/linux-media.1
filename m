Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799279;
	b=ZVvtIXY6T/6aSu37JFuwTOLQwjfkNyydr5QhkV1uys+5gjyKoSiCc2mmacg4ZTwQt5Wf
	 u6JazAYcST+BDO3umG2RtvClUGA52j+sJc4mk5mBhSY+5MyeTYH0KO4nM2jpCf8I2ZdcZ
	 iaIckeG3+LU8wcQsXfG09JSxc0AZQIHvdrbAZdIJXjk0xF30hOQ49d0SksX7h2wbSl2L8
	 4JgtwicYyRPPKD3mzvVOTJ19qNe/XcDJszFyGGRJN6n08stU9PVsp4sanF4NFt0D+v3ob
	 htkcCrNuUoMY1Fc+ScHbMVVao6Unx8KKNx+DUmnhaxTU/VveNGpW6PdT+BvRDscvvwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
	b=pia/LaLDjatZX1RqA5p88bz/bpOQ9tUbJO38w+y1oozX8j1+ReQhrOtiXvScawYF6t0I
	 L350Cr5vzaHqjCbpm/YKysFruJWaHPPS5WhXdqE6BGG5BvAKU+xQVozCLTqDM0JNXcOWH
	 fx/ErJwHnNptyelyVa75vkvoE7HCZ6K4S+sxA4qYsn0v3zrJe63dtUxnqc/w0WyI/aOpi
	 lP7JPzHPC8lMB96CoYchZh68b6sjX1/N/bljrceImgpK8mv51Dc3Zn2HXiXAxJtRTaGy0
	 3JuTjRKDf28cX+nZ3RwTo4DzRwL+9rK2gvrRETKRvLvjtpXExfro+oINHcNCbMA0T6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cn8KZKcE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE81wKZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A71606A33E
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 13:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A71606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cn8KZKcE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE81wKZ3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZw8b2667800
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 13:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=; b=Cn8KZKcE6Wg/6XTH
	BUZgiHb8T/y6msyUSEhepVFhIyYlaXNv0hCO2bDZGtp+mf0mwOQCcR7fM8g6DHaH
	fA7HcuGHmJpSDSis4QQPWcTZ3jHjlIQSY+6kGecmYMWcyc3RMWHASe8clvvgvDzR
	vKYHdijS7bTtX/dW+yeTpiXW+2hdb65fZFSyyL+kJxX+fV/xB8m+eLfwfBfbXSdT
	jTj4mtbrdEzR03Mxovcb0c4//5cqOaLb9oyHCJcLSwJ1+qR3IWNVbfj4DToYCq6b
	r4idOSHmRKjFGmRdGJQwtp8RZFEgk//gm40gKSuMsce1KB2gRUkY1UVeoBcN/PUA
	2SayWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pmb3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 13:34:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so235598485a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 05:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799277; cv=none;
        d=google.com; s=arc-20260327;
        b=E9gEd+HHa4kKgzOoJRi0ZBYrA4lU/AHyJD5sBIqZm+t6Rk0wlpiYzisP52JYa6nYPF
         /3r1rYmz5mO3bEnqr69IGM0b9F4HhVCSdBZdWE0c0y2/OoD2yETbzVDbqmImc5GKB/rR
         +Hle388TwKNXP8AalwGOmqVe+dzLCa91SWgnl9c1ILnSPlnCyVz0rjQACZXnqkLn4/8t
         Yv2lv8+BTLK+gsYPhD/6DYx3ROZE/PkpRmHUzSsHj24lpfrAg/dNn3x64Et5Ur21APZs
         DyR3TldxDJDvLBAgvcMg09InBF9vZE6KBGZwzo4+Tf7skVkW+v2/hCUFykpO5dPePVXc
         O0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        fh=0Iiu5uz+laDLUVPexgRCGdly9HgmrRhoHyYtpGb06DU=;
        b=mKuZBrbugfkpX4RCJqAF7Qd/kh7Ya1hhpRCd6GBeti54ZGRZ3FvIRHn9ccdv9BOCbk
         nbIW35mEtaMkCYmHyrfWZiJxxOB4ZZmIXrfZ9YFJAdM6I1Mlws4v45HYpEWuOJ3GzjE9
         99TLzHMHPrDovk1sfF/UIUBwkQI0UTc+dEb9pM5qMl3mWqRQGImE0BHz1JtCDFHk4hFp
         5C9KwRlu5tf1IT8UdeaTIT03H7Ru8vXcOj6+u5qZS5J0ST3SYmiQRu4ouod7bXXdANOa
         u/4Y/YEx57oxf0mzCr5WcxU5iI3yKbJii+hG/wTeHhhyQTFECn338VcKCwj3YWBemz7U
         xUdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793799277; x=1794404077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        b=dE81wKZ30NAzzlEiQYNfp+V/WCOucils9bzffwvpBqQIlekQQZMhiUnDJoFCyzscr4
         B93XFUbdhildBlgFlb6RhxbOmXa6PJeNA0JmCrLwzIKxzPqzb9zCVf4aetp2AE/DY/iq
         rdQ1jCfLBt5Kol+5PvHVnHvWYiCaV/QVV8u1KxMsotIN9gMkQ6ZONNtbEnsFTtfMrjkM
         olQEBqKAe1QHjzG2ampEkhCrKJ6bi0KCFpSAp/QqpaidR/tYvK8NdLP+IO/FmrV2gr1J
         7cJ/aOC1pYpNiHzZ+zFDcqvdF66PwYCar2AxAHTUxI1/pc5n23T8teItNM2lJJ0C0ZxS
         VS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799277; x=1794404077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfQgDjMnVAVUnP4NTj+CgKQOQ2iN1wsYz8IP1FUO4Sc=;
        b=H/5IQ9thOHBhIjFhW/VVTzMWiljQgWVBNhXkO/Owq3qu3Fi11+2+wrY6pogY11kFX4
         wtoacTeY2nehmFMKS6r3WM2p48wXCcDEEFykV6iGsi9v6LLI4y1p4JzGjQDC/DStWHWJ
         wnB9pjb9A+jf95/J7ttCWhTqWGITtb2QHwMp8Kw5lz3z2Icgd00ZH7mc2tQPqEgWG4iX
         /D4wS9LALwULV7u/o63i0jgFeo6f5B7/SrZ6nj3WgkzDfDWx5Urd8NicV1ELyptNfyub
         KWphg54wUTJob4cl7HCGIzhthP+hpINOHGZRzpsWCIyORsu3MdY82sjU8WLcbwIEnWc9
         u+9w==
X-Forwarded-Encrypted: i=1; AKwUvBzgy9G5GLnWJxd/UratngqefSEoBdwfyuTHQ0kfOE+0LJJXomTZcFTVoOv6gw8+4hO0AtzL31VmBAbcqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9H7Z/+GvDXfBfsyB8AqWGgDjwbCbt22gbSxoRASLu/pbrIbV/t
	JgkvSebvgc6oUAcBg+DhWm7S1LtDJ12lsxICWNUzH3Jy0n6BAfisVPFEWFMBRkK+u4sjVqpRkn9
	g6yVOTk+z9XJSwffQfoc3DmROmG54IqZubnU0bJr1mumJUlvbhCSMY/RlgAoCaHIZnc4s6BpYHe
	YMnJCo1UCIRK9/159H0WM4r6CcAZGISbusjNPlSb6C7awF2UHs
X-Gm-Gg: AYBFou3hSGSOvYEO0kcmqtGlmLQM3DXEU5SJZdzsXWH6Ig6gPwktML4VrLnbqO7nosM
	zioar1EUATDys98GC9+DUw6TLgxfhvwrarAbe1ip0DZHj7nupQ3T+wGUsNHxGfLo3Td0KRzGzzJ
	hBVsqN1FwNsMScHLF47ollPJNGoqJae1BJsePJjEoC03wvOS1NvPrcOQEQbP77iymWyF6+lOKVU
	jpjshEjshBecqIePUXhW0dTDoCxD6RG+/pJZg6pq/+TCta60fiua9i+/Fz29TCP9ZRpm75ScuA=
X-Received: by 2002:a05:620a:2806:b0:93e:c12c:fbbf with SMTP id af79cd13be357-94421743096mr2741358485a.76.1793799276696;
        Wed, 04 Nov 2026 05:34:36 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:93e:c12c:fbbf with SMTP id
 af79cd13be357-94421743096mr2741354185a.76.1793799276161; Wed, 04 Nov 2026
 05:34:36 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:34:25 +0100
X-Gm-Features: AclHuK8sIP1g3VJCFVQu8HgJ15hRg7BjfVkjbLkQBCUavzjFbEckrVq2BEzz91A
Message-ID: <CAFEp6-2pxr15MFTUZ9XJeLS80bQqrPec3XqvS4=Xkp2UUNHw-Q@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX9OIgFh21jMfk
 JMH2JQ8I0kSCDd0aHz4WQBH5uyrxpI3i/ELMX55MaFBFCArll4TxI3g/hPvk9ZPrgAYjBW5Zc4d
 D6eHMS4uHM33MJOqITI6Nf5jy6GkNFMNHgoYCLDIt/tHrHamEvNZI0wrRHjxZzPeLmM/Yq5cEWj
 Z1gWszqqGFXeNO1RAFBIRPitV2fIFsLrXaQtJv8xUKHAHooSRVowlTOe8m39TybDBrksmHFzPxv
 qgZtl2LBpLlSXyVpVMTEY8UtPhoRU7nrURNrvmpxU9TjIxvwegTZIo+PM2WtiANU2Yuq0qY2hm4
 +A2UXAwqrjufzfZtJMXbSd6LolOgbISdRok+pOOZhd4oIn05VDoX43/r+ujEEDytqLX/6zsVGGV
 seQ1vVpqAq02AxPuL+hR3haDaZ/zTXK3peoEqv6sx1+GWXiUcjVXgpCXKTPtAxEFoAq2uZ089aZ
 8kv8WHyrG8yNQM/7RUw==
X-Proofpoint-GUID: dgXy2-FW8de-MyjRvFPOhQPvk6MuiL8R
X-Proofpoint-ORIG-GUID: dgXy2-FW8de-MyjRvFPOhQPvk6MuiL8R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX3Ls/4NEeQnHP
 B/9q9apHw595NnHvc+b0M6cLFBDyUevmtEU0r3gVfgbtTnGEHOUUuYDu/QcHH1BMq3rLpKLfACL
 3WDX7AR0/AYacwAC1DS6skOD69e+ISA=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb346d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D63WGRmcolZUcHqz56wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040053

On Wed, Nov 4, 2026 at 2:00=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> In the CSI2 PHY mode CSIPHY devices are named as csiX instead of csiphyX,
> which is inconsistent with the legacy CSIPHY mode and CSIPHY media entity
> names, and it may be confused with CSI decoder names.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..dcc005674d8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 po=
rt)
>         csiphy->id =3D res->csiphy.id;
>         csiphy->res =3D &res->csiphy;
>
> -       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> +       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csip=
hy->id);
>
>         return 0;
>
> --
> 2.53.0
>
