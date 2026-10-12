Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079F3F0767
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813291; cv=none; b=fUgl6N2FBvWt6JGViuw9xz+Ett1j+yBceoF9HmfWezm7kSl30DLeKOTAIoqvUDk7aCnYHfexY73f1qqLLeZCydK0D2CA5gFIS6xbIYgI1NxBRgQT38D9W+S3qyR4/JCm4PnsaPsO0X3As+l0tA2QSW2nVJqCMiuprtHOo1r09rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813291; c=relaxed/simple;
	bh=58RZ06m5HkndudGPZ5z/6FTzyvzAQ2MwHTbtgryBeWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaHyHakwPeShaSHd5EK22NJAP7e+qf67FsNSGl0NEXAOzAymWISfCblhJZyOfIQyu1Vg5QxFAgXBhLZKIk+4oh9yhOmxlujXbyjyYErG4ZXxPZ2neygKDaZwF8Hr6DLXjnETS1dwgN92gl/jn3yFXEZ9G/tyIchwdD1G5R7As6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqP8BSZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk372UXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqP8BSZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk372UXD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WAq2252715
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfHzq7kE4KUw2rk5Isgr8vtG
	bIhjMRZ0o6HxZtX9Gpk=; b=mqP8BSZ69srrTfMwU9Pf4Pxa44hA2aMLH9zVxlMk
	2m1Ez3zsTBqdNAKOUWUKZJBAeni457ZibYdQM9AG+ddNPIa06j8dnQAJ8C7PGWNx
	KStqnkkHQb8HOarFDWkuw+G9W8ZMYzJ3NWRJ5/vJyJBoDQgth+M09oFTfT1XpWhb
	MfxzNAl9PyrLvWDjPlMmhykJZGiDZnQxePO2pnF4wHywBUOTseb4C54AJrg+RpmM
	TmLGT+PUjZp7n00DbS5FGRWn5mAZ3cEP8NUibJWr+q3k3+CAigV7MAnK5NA8sNXg
	O3oAvzbW5qfITrhyrVnqQzLTjA42zlYJ3ardlxr1H7fHSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713989-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:54:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so361748885a.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813288; x=1792418088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=Vk372UXDOIM2hAkB12S1crlHY5Xv3OzIBAtgbbHFFT1oPq0FiuMpLUzJk6lwT1Y1Ep
         TAZjWUsuGWVmvCpq7gJnZ/Bp8Tn85E353a8YdthwIAuTXrAWfs77LIwOjJ/Tgn6wdVFt
         nZdSD4HAmjMQHI91NN02BXqeQj8woS200HtdAgp+whnLxI4y+wTKc8C3ftltAkk2Y9sK
         9l82JNe5BlSOUaqGGLSwHDmtIwtyrkUbEVowmuOvtHq1TpA+Rlli/bLCRwqxAENQrVoB
         BzWhd00w8XWz7Pyz74fn6zgBT1fn1DOhs3sDI69DnhkkTTfB3Bi6oCJxUO7MOccBKXz4
         EYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813288; x=1792418088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfHzq7kE4KUw2rk5Isgr8vtGbIhjMRZ0o6HxZtX9Gpk=;
        b=Gh1idSQM7bOO5p4wf5VZZ4QDnVl5uCx32Y+ImKwAhfpq29MwLtgXrr2SFlg6VPdhrf
         JVyBcfXxJdvR444q+0gQJ2XxtZ3LI2AdL8/Io39FeZhYG9kdb8yfhSeBeG0KsVu+z8RI
         RbVBcQjyNnFAgQQRLbUYzAxG0TFpEGYaqQhtV2gLZpHlEp1mHVKiL0MnbUebvZZCGdZq
         hBBliOAgpaWfPvxvAXK9zr0lfCNoP9gUeUqx2g6DZygcBKGwJtSMD1QVyn03z8d8W4rw
         itYiqjLukUhtqCsRIEM7gUdn8iB2DdjOQaX3DYUD3sgUy0bHx6QGMwiKQ2nKse2r4b55
         2UVw==
X-Forwarded-Encrypted: i=1; AKwUvByJKHH8qCf+LpCahwksh8/WSC7A9JfrzCEm4UTScl78e9S0StCB8YB3Gf164f19t2th7vHvNOqiTwKPzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6HiuOUY+r1HkBU9hTUCkDkG20rj67mSMekB4zFH6ODEJSqKTb
	9TIxZKIX7qEQXuYF+pjMoiLGMkt0jke/Bhy1qUKE8hRtzhZNpDUMrBh0vVnzN7XNxutPNMPFJs1
	+zWXXNYHcrD5IqGESFhAbfFK1z6ikK90tuuPgi5vAKmCpP5e4n9TJfKDSaXstnTR++A==
X-Gm-Gg: AYBFou3vhLHqfsYydl3liTEe/fgnkU4KoJ1jbZeDBIRc1k44USSpgygU4gdp8fNg3SP
	GEIT2+NaoqOvMEFc7jzMEwBvmOxby3VT5H24cV6uyxl1sarHyV0X0egCLdNF5qVN/otHqk1MQPV
	LqDqhR9pMVj75q+mOod0ijmZcecbx66OebohDwpCfklBG+xWqGW3+XJbkVwtSXbdTsDZNIV3Gub
	2Xr7fkHAvSjRh6+wPFeX4u1AiAyzwDgSEtwv9T15pc0TI8lwSMWzZ/Yb5Nq3m6jC7K+JEovsmfo
	uudFUrCE9VpsV1OIFj6nDqaiP9Bd1eiUW0KR1XhjKXUmd1/mAmOqM/RD53wynihnkDL8/eWtt0J
	/fKszopoqh1FzzJo=
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1590004885a.46.1791813287569;
        Mon, 12 Oct 2026 06:54:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93e:4833:82e7 with SMTP id af79cd13be357-93ebd22491dmr1589998885a.46.1791813286734;
        Mon, 12 Oct 2026 06:54:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm315386005e9.14.2026.10.12.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:54:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Message-ID: <5qabq7hqheokkaim2ebyq4ubhuhwlujuvv47ggk7scrlgjv5m7@2qbh6uvs7hck>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfXxSLA8c85KWYw
 DGZcgaAXlF5SzA/uXDLfJFQ1fY+cyGYXMRKooQXS3EBk8IC5Dk5Jo1WqpVSZnG4SG2iodwKm+m9
 pBgsu7DyGk+WMCs4Id0mKGcp6dw8/pY=
X-Proofpoint-GUID: QRDcIKhwPEatXEhjgaFFrPUJLpjDI5Rg
X-Proofpoint-ORIG-GUID: QRDcIKhwPEatXEhjgaFFrPUJLpjDI5Rg
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acce6a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gNcS5RXMAAAA:8 a=6X3vJ2KViZPjrVoEpqIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX8XAO0s1d8Dlb
 i8ZNpWQuCyhuAMAhpj31m+0R43aJ/vDfC/ynLf2hPMut7j8htT3Q0Ra6n6rurFjeoxZFAi16uWl
 5Zb24I8KM2tr7PwuFOu9npoZSl0ETmOyK1nIO6ykWNn9K4R3yOe/pDAFj3aNdkQNIsfvl2DqlU6
 ihquNhY7U10Ardn9HbnRpnsK0v4uNHsX4qHuaSxUFd5lIjaSNIqbCkB35QZp+o6X/ZYSmo9VgTf
 jE4WmuMFOtMVOvAsxcF5Ran5oDgTQvnfMLfOQO9+vY8CLx7C88x5OzNVR7EVnc811agFx5jSqWK
 bhEEqcGG6AL2FI1/TFKhmetp1HvzIUaou4juSEF4h6HQBLgxSco4tn6BgHwvQgItcYi/AtEnasr
 KrYV2T3eAKHgRg5DtBuDehPVtcK0lHdCYzDUFgFrrygiU0m4bxLKF1E0Cl2oHVQYuicMnYrXSgw
 CZz7sBeRQmc8RrbfNBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055

On 26-10-12 14:51:59, William Bright wrote:
> SM8550 has three CSI test pattern generators next to the CSIPHYs. They
> report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
> existing gen1 TPG ops drive them unchanged.
> 
> Describe their register regions in the binding and in sm8550.dtsi and
> add them to the SM8550 camss resources.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>

You sent a v2 in less than an hour. Please give reviewers a bit of time
before respinning.
