Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4AB3BF699
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259340; cv=none; b=kvqmshKHfblv2rx+w5qeGGfntkL9u6zT5Gd80cdxkqW2VVLDJuslutcEarKWUrLW9Zo33+/CYvf55eVjFkP2JCBQ5ElYnAvhuAo5EJqydpJANQPx0sEzcpe6tEZADbAp4NiVG5QrUrFMh140YAVRj9ciI62p7ZB+b0aFg7AKyW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259340; c=relaxed/simple;
	bh=Aw/rmo0SoMK4/1lMvg0jDlp4PW6t+/JYcPEVs+qk2SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFzmXeCkirW0yR4UNqP4c4KjE46zmh+mhziCEh0lFxi29JnqjewMt72vXhE0dBOCmCAAGwljfTPgLreGCz72tjgmRnwQg4LqcLoSfJ0vBHNfT8SVgMjbihHoK+j0wpj1/TQ+EF35AqurmzPMw+vJKlC1aya8MgDwrdlO8gbWY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBmRWW19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQR7WHr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBmRWW19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQR7WHr5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9px42598631
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=; b=pBmRWW19n67uiEGr
	mbT51M6fvZ6VAFyrAkl8BlM1cMc636y5XnCOQx990UIlWHlsOUcQeh5umXvxtUKz
	j6qrSCLUD/o66mnrqq+DO1E/x/gCYNC8G1QVIZqR7rsfsyWWsk6L2QV9kTLMphAF
	405KNjZw7Lq7Jbj6Vi4eUZDcB8wmAK6ON8MhG3DHH+9ZkSRGzL132LBPwVn47Z6o
	3UAWUU1eCQ1yVHPYBLk4K56krSEsFGoaFp6ti/6zFCy8SQWvXpxML3DmCeFSvAq3
	woBrsRnfqMiP85VzEK2FxGniEGvJty0CiUtl6JogOUOKLjnJAvqQYsi1IhP49z7m
	UZRzmw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfssn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:48:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso1434318eec.0
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792259337; x=1792864137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=gQR7WHr5WWNc+snOSZhWnht9TsMm0jUpmypnPf037sFK/FZfKP+hsS1xSJA36hpMw+
         M/JHpJMue78aMDKH5RONbOBMitM9Yd1EU5PDvOogs78aG/d0hOHniXDo7GWqWPgn1/Et
         YxeMMlCFrJ1USgE8XjvPmqTGBMGVzGnvBzh0zFQitnXuAOceb3czvGs/VgYVMHqCL820
         pmh6VPpGqYSV8Er9LmcMseS6Kndm0t/SlEdRXCMnizTKGhNEIljrWw9EWbTRfTMSjs0q
         ZJBXHdV9PkGFwCU0COaGf7SwdksHOBEiI6UQVXsQ/MmHm3HuohwOU2rPuyrN7/jRMlZf
         /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259337; x=1792864137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=AfVX1D5Tzp/2VojSxCpxjAtJymc/7uCxhblhMom8HRufIc+96FJ7HqAUWDfaW0qWk/
         N7/IdPsHYQNUYnRAq4MnN0RxYn9TOWuVEog9Bxkn72mjg+ZtZpnC4BhS0zzVv3jk3HiD
         HdlnGGOm1s0tDcz0uK6+8PnhtVbXmezsH7W4weLnvc8pFgQwXC9eSHsyEyusU5lKlmP4
         UTm6PVqq1TEBNe4utRkdvcmccYSlzkQYLs+RvfSwjOpm9RlX6LDPP8Ftd3SpVWrbCAoA
         gYEEQj19Fc08cM69k3y2vIvbgngQjR04CT/hNVKygXLal4Jw1RDlpjkxSwt5LJRmyKjB
         agmQ==
X-Forwarded-Encrypted: i=1; AKwUvBypoRCOcqFFWYMK4jJfPwClxlTiU4nKJ9LIHHIUNjfh2IGs9E6VWuLXQOGLJkSik9znl4egmfA5q+juCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJRgsAjeyjjouZsGp5zCAUUimcUYmT/X1A6w4AkZFMw+jh13AFs
	MVxlhSn9yAwbInEdhp/xp3af8dohu8V0SEttaqtYTHRrOq6Pcuki5Qx0OU4I/RZEtQh/cUJgJPb
	RMDxdPgwzbapshYq7FETVlCQaHi741j3hsdYj6iJNTHMt0RFiG8KgZw0L7qQtojIhzg==
X-Gm-Gg: AYBFou0mOYSBK+KwsrUZHYhZyBMXZuF/21/ZIWxIywK0xQruCMZR2VYehn4X6nAdQEP
	uBXKj6/CkqUISA7CukcvOR+MpumpqrewlzeLADoL7ruvDD0ufNmbb+w1g5hNhPvrg5udlSkKW7X
	evCESEgSvxnbgfgjn30+QMQHkVzK+KH17STRH6Rudlg3K2JWUyADchvJfcAM9OcxeWgu1b2bVxU
	7PkbT3aafXUdfEHgp9ZXW/c3wbhBMmhi0fAvfhdNiJyszA+32JuJX7Cjv4Aa+ydfB2EG72IZNCQ
	MMPlQS/kn96Q6LG+DUVTnJ1hleksGqggfTIhtBS6Qc6KKQzuUNgMZ7AMk0JSrTAwztB3N1ijrsl
	9c8VfJAXU9Q50fnljk1C/z3bxH6E=
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604664c88.29.1792259337047;
        Sat, 17 Oct 2026 10:48:57 -0700 (PDT)
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604632c88.29.1792259336472;
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm15651224c88.18.2026.10.17.10.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Message-ID: <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:18:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfX72ejwWNSA4A7
 ipT+cHgujN/+TTB7i4yFO0Xkebl9u8ZVauofS+wAxUlDVEtUiIb3KHwWKgo/f2JmEYeD+e8CqYI
 10DbWggosoNR4hKtrfQcscUjYFD+iZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfX77P+lvvbAkri
 UAGx7okJyxwrRTVQxuNB6Pe9m5Euj+vKmZQ91/eAzUdzLANVUdvCvfW/g+gmvkfymB0QgOogLs9
 2kSb3QXuLP8ecrJj4EKWLz4zLSo4+KIvhmm4MPsecnWf4T5Nqovv0S/CT4MsP7h7gPtnaqFa4Xa
 xbr6RUJjdbmHuD4Xat1KWToyVbudlJDDcs6VGeCYWhPz9zUtDeLLevXz84wkNQdKHBJEaA7wrTz
 8EToAoWdktLYvX17YhGZDv5WnDAemaZKzeGxM/00/54f69Eq7bGV6U5GDRQivc65xPe567tYvY+
 2OP6DGrIwgkLY7qBHj9lkQvNXVjTh4jDDVzcPf1g5ddiXNJO8OJ7s43umkJhddIj8oMM0bvd6K6
 fDz8TYBukqHXCHNS7wf3VvwUm8gTa7edgFt3+cIQPE779AoyZEuZWAgG1uirReblpTkf30fTar0
 4Xwu50a0PwykgQni2SQ==
X-Proofpoint-ORIG-GUID: eVeWZdDl0g5vUbKInxS4zHmnPGGwGc8y
X-Proofpoint-GUID: eVeWZdDl0g5vUbKInxS4zHmnPGGwGc8y
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad3b509 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1xeFRXLZlQdsslsJnZkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170070



On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    csiphy0: csiphy@ac9c000 {
> +        compatible = "qcom,sa8775p-csi2-phy";
> +        reg = <0x0ac9c000 0x2000>;
> +
DTS uses 2-cell reg but binding example uses 1-cell. Please align:
  reg = <0x0 0x0ac9c000 0x0 0x2000>;

https://lore.kernel.org/all/20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

