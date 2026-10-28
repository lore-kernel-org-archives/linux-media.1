Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201253;
	b=EZUll8LprHV+SiV+AdpRh5iGZEZAR+tT367hSX+0Jcs9lhKgsW4jVqwpJiUsaz8mVVIm
	 jXKMJS3EgI6hJNbBzZwaIubKBYF7MipokYImnmeczpA9dVAQMJ1od3vyQJKuMe00i0ykr
	 ccLGfvA6TX/ReJd0QDnCI6bHXyfiAcvQXHNJKm5mtBLp/CCf7yNrfpJky1EXaVVbUgW3E
	 JHOfTU2boHbnRauRX61zr+R3lddH/QL/QwyUFpDXs9tPTqCA7+JoDpiDJLKFJOikwDy+S
	 //rJIDhZELfuOEUdIWYfFG/6j6ENtk4pax8BCbZLmrZPn1Zgy/lip3GXasA1mCenF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
	b=e/Sp9SgMIGFHb2L8WdDg3mf5MINQ0rwLy4eYN6L5icznoz43Zf5dUOUTcZBy4DsNESYP
	 63Cx3jlj8NGrwDLz8GjYgb+RiU709VciSlKgiuUJseQArFZZtbCjBbk1vEcmuqva5o09y
	 xx8EFDbzhklt9CCCfrJormjm+tzwosnBkVhnfCM24oT8NGA6AcluzXNzwRqTtNC7Aa3Vt
	 pCGLgJY7XTvoZ6SZ/C62fc96uHzVoTSWq/1ACbfYV72f3TSolOEEN1E151yFsmZT51EZF
	 HvkJdCpxkAZwwNWbe7fRCeZgxqC1DUDW4BH6SCR+svw0lDLmyPhjlkBg/UmTM+TBMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wp6/APDX";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C20606A31E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp6/APDX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADQF2001634
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SgVHroHe26mmsC3+gKDh7ooh
	cL6PcbX2BsXPMljkV+w=; b=QWa4aQLQJ7t5Qu7+L+ovdgFII6i0DkdBnE8jX0jc
	EKTkBHl1iYmWClp38auy4HjJDN6ANj+baTwqQ//2CFwIEoHRqqVccJfShmhep7ho
	7xnRs5xyXLW9Y3oyYa6lYBVETCEBqNT/kwqV8yvh50pKrsL4XeyocCmaYRkAzObr
	Gq7wuhDAgW/a8Ss8zaoSoyVk+44duNUyY8+GRtbpoFDXFUSpkY0UtoPkKzi77Dvu
	XCFkhj6vdHA4lWYM0toq32Hv+FY9riEz+LODeH60Xd/7dD/cB7oeBKJkvMEDrqZx
	x/K5ED145SAULBltjUxVfsj0ApyBJ+6RzXj8YBT71VDPzQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sn5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so170120137.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201251; x=1793806051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=Wp6/APDXa0RqemUiErRdA90IyeB+vElS3ja/vmjbFHEnKEoFmsOE8qkyeaxfS5P6If
         B85CYKFaeGJPYa82OSUHx3i7shf9/uDTejfq+XkkGCo470XNqZtF7FKmWPyYqWjMDpv+
         F4SOtKrGNgQi8IHps/+LRYunPovg95uygIg2D/TbkK5i6n9bDcz/bTbFP5Fxj10HxpmI
         6oabE3y9AbuYVHcXohvXECm7XkjaL5PsDYtHfWaXoV/NopxCKtZtFQnCwUU6DZS7VEbe
         OTYesey0zVw5UiIMdBTPKnroWMKadG/Fi11mCxsxifhbR17uhgWM19pBm9A3yPEkUI5t
         nYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201251; x=1793806051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=iIxQy8CtELxlUS6P631eonzvHWBBpii9O8yGuVqao09XCJa35RbWSaJdHNo3+Fc7iT
         bONTN+IeOTOdTUG+OSWYFZIPlX8QLXE7Ho4dx3b2/Uj04b54AmQwBasvWV/WTLzqHoQG
         Lk/GyzguVe8r7ywLkTjRi/XcO5HdFkNYB4O8mt61xZM3kJvb4JBgD2vmVWps/1bMFaji
         hN/6O1lpYx2y6ruAO09fsucxKxU08pHFeNZx+4JBr5r2XY2dvWHIKytEdIZgh+vmVyJV
         ZshzzbXurOwVt1KtwMtSpjmAG+ndAQtl9dqjyIySA2AbSQn1AByFdpCx4BIFH8t++u2L
         RUfw==
X-Forwarded-Encrypted: i=1; AKwUvBwZvDBARlGyNJHsROmflfsZ/q/o2t+EucV55S6Ys3ntikswHN5f052tvfLAt2Z2Cdjrhir5isrdcxVkzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9hdyUWczjqFfvL2rzW0nQhxEFppsZdz/ISyme3GTmmh3CPcWJ
	ILJ7FDEcZsCIdLgCwzf9jV0dsyrt9iHokVRk1Yhlu7ZVMJhcJgcne/SLJEX5LjprNzzyJbWhrfy
	yLayBRS0iL0//H9Uj9hVcqD/hAyThxlklWoWcdNdX8Cz18J8I/1b+5htFwXhLInbOkw==
X-Gm-Gg: AYBFou1gENOTxqHwrL0qyOSzq09wjjUs0qAKA1IIz8Rrp8YSfhqwYorLeWvmXfe/b8o
	DKMWN+DKXU9XZHWj2b1T1OnVMYUa9U8OJML4kea26Akkb/8XhuY4wsQzh7Ptak0MSbiQsDyZIVt
	2oo9e45AvbIZiS/A68mW/8lOddrBoj2BLKhBsaxN2xzRzNruXyqG85PU5qzPi/I3u9NeKtu3B1X
	mJi9iPCcDLB99Z1yZBZ0/v08JMDC1nvFLobZ1tmg94mY09NrwF+Ls/+4EolV40nGErzNGXfnLLD
	lM0HiLVCHZCESYKpX9bV8Ud/qj7VeVxqCcOxnqzRHA2adH3Tkn6maHfga06YsewoJpm8Z1V/eqh
	JQMVY/UB6wBFNYPWFf6jiE2sz+KsxjIfl8wOvEB/DzqgVOMWwgeRDRZPq8uK5VqigFQ==
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252784137.18.1793201251139;
        Wed, 28 Oct 2026 08:27:31 -0700 (PDT)
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252748137.18.1793201250182;
        Wed, 28 Oct 2026 08:27:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35094685e9.2.2026.10.28.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:27:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Message-ID: <o5sj26cm4rwf5w7pxizqln3dvyjfbpgkvfbfqn2isn3bwsxvux@yurxx5ptr7gp>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae21464 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GCssnZSmVGVrPJfrQDAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: wyxCcovvmYra-PUzR7UiyLA4Ta3HYUef
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwGKMRUCowDsw
 TlJ1aVUAoghHkZOinzrOkjV2d6oB6VyUoe5yTWYSP+r3JxWud3uCam668Mfb8BFkWnRZNDrOxK9
 H0HEuYTcLtW7v5G7BW6tpZ4BKpZtLmU=
X-Proofpoint-ORIG-GUID: wyxCcovvmYra-PUzR7UiyLA4Ta3HYUef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9RNrj4T2D3aO
 I6uV4XExOMkaAJcbvyfHPqqBnggEyagJVwjeVMsVzyQ+RwI/WvSuJU7dnKCqohXOfI1yDtxhQ8b
 F4mBezXibf+w1laDpwM8gc3ibwtKz1Z4nblRPVknqgbPWkGO4M8ANd5LaBzVNO85sGJ7JbxHdfk
 hT0d4Q5uMCIBFaGHYdth5t1SCZv0y/FeYOnxaSWt+/Mj5rI7oFtuO3X5Fmx1x9I+3hPraeoSYLq
 3d0m0H9FuBTHQ/mBhjxeCVLylDPBS5Sha3K2yG2dsCSQyaYnJlm+PsU9bT3TxfFp8BSbnG6Hy/v
 pVbYFiRj5+2KpcD0Dw7+vhYgONSpC7cMnX/QR3/o1DJZjhmk2qbLWiwaAxjFThpMExI64/5vfnf
 i7pMXc1l3yCbSnPg7l8hIi5KJdgz1e4Z+II4qTpEo5wACxQuSuyzUh6Vwe2Yf6wK6gvpPMIeUCz
 lhy8eXPv1tOu2xb3zRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:36, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
