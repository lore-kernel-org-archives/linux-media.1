Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9D372663
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766308; cv=none; b=lmWX0kGVT1tdIWo0npzGEBsptyjBKUHUfqCw3RsheWfmYgDerXORpMbF2TE9piQyNTVYQ9PQ2ReTm9aptioZdfH7x10339tFAjFBR6B4+9mHiXfmtE6KUyAjdFbchrfzAhlNwIaKlWHMSBh/o3mJgjfBjpMzIkCSaNbYU9eMRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766308; c=relaxed/simple;
	bh=PknkWi6bFhwMmqL8I8ZmnWoNz4EVuxRbnexTR4caDrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C405q5lNAQ7bcqrwGXCHCoKFg5J0EQkQX1gAnO4/fVLa3UKaokx9lqX3SgzH04pMsgDgCzWuAoz9TbK+eoXqtPAvGF12Fqg4JfetsIjJJrLT7jXys4P+q0gQPE+AWxebfjPxGRvpUQgBIDQqViYNDCm/cU2f0FOYGp7r91TPSEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHeFITAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkFMj+wP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHeFITAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkFMj+wP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dOh32213381
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=; b=dHeFITAhIHTObKce
	Xg7F+2RFwKge0dwaq72OL/lufzBzlUlWrTMVlUydLRi8Lb9/nyMcoPkW/RU6LhLd
	V4Gwl2v224CsOwTQxHejRXDbvzuPK/2mEw4C2Ni+/8RGBmsOP0TiHGzhEsGHWCot
	E0VyxGJ7xw5hpptjCWezroEa+xZ1qgVDvS+iaXU0WFcvVKP3kur41KuJ614KVZvZ
	XkjttkJOEPBSmgmKxuNsepYCZTIWN/DeWWCmGTLQfiHokMdzz3CeQsoSNwXr+3Cx
	KNSaBjjwXmetibIFcg46XBe6OcmRMk4qwRs4HU1xRczYr+1NybwpeCRCr8PYV2pN
	enSoyA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj4p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so1284346d6.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766296; x=1791371096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=jkFMj+wPAuClE0i+btfCk+hasVTs6cUnOsTZJdEvu29+T3K/Pbm1Q7LQwHaiDFfpPA
         hXyPLcKtCwosKJQXuwrb1q4YNHBmj3SWmOLFiubrg2rK6i/ypaap0iPZJr2MXynjPewp
         SG0V+J5dI0BxCPHaQ9htEVgaaCo7obHJm7GwGMnjR6Gp5c6MEI/TgVJGbMJd4yLFonhg
         lEXIAzCxgA4+LW7JswqR/7xaLhEy/QJCHa24pPJWKqMx1uZT7ABt3V+3E/dJRjqHie3k
         BbpNDNPVRkUEwIgtSueCOq5DGuBEA2pQytceD0VEJV7K26TiGY3Ea2+Yn5VGKGuoZE4+
         eglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766296; x=1791371096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=ETWJHRiOsf3wa5W5ZiiANo0XtNvDRG/E7j8DoSAGU0RIiQVfnMUaBblwt6ph2cEifq
         4w39eZI3x/BLgWcrTW2Hp4mkK1ULJA43/9kMPgF53RIFh3rfiKumJBHLi4TY5ai0D28m
         c2//WZl06P7zRodt5sI/gvEp+O3lqbkP6M1hgZVNqZT4x/E8Q1pOGqOecq9h+DxwAuH5
         MZAn4tSxPN/+GHMXXZsrO0mwyDA4KwbTHS1T+kpJZ7HmrMRAuKvJsRenNGRKiGH1Bl9R
         bX2EX/b1CZqjGEgpRSFWNums8OSIGy2RId0vK3fsdE4t0/NnZV6rwiy1W56qdoQIwrnK
         hMjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK1AHIJ9L6QpRDI9qUVLyUXYa5DSGlzdFAA6FtdjYiW/trrofsqbmNf4uwWMRS9CAowheUUmn6k+gaSg==@vger.kernel.org
X-Gm-Message-State: AFuF++lM9PX22+Ox1UqpAmCK95yWXtJ4S520huwRvaacMXR0hLPnmL6u
	egBcQdZbDHYdpuUr34TuPeYG4qsA2eW9IBgyuXUQ5Dcsr9PYc7Q0Ti4+9QGpBKGZ+T2w98Vy1Vx
	KsuV/GSWO10TdIwjqlXH9rPKQfZUDnvMUAHI+wIWNQ+LwygzxNBuXU/jECERTsEShjg==
X-Gm-Gg: AYBFou3xG67xVnD+bRyVgRbMo6c0xPU6ylkOZacawQfGPAKD2CpQAGyL4hE665e6eoZ
	GD6lDTOSFQuwSsyg/BcggKZy3zXulxZsL4LJ7iTRg+MmxtDsLWyk/WorLylW06rm7EP2w4RcTiX
	ECM8raeNb3H4chNwsrvJS6pv4PGyTMUMdJH6aAQt3S5a9+N7aWqPVplqDiI6uuZdFFfrknu+GSk
	kNzBVVmMVoZzqSP6RcKNpypJ0fW1gA2gNQ75GnquDiM+595MnTQXsQ5Wt+MeoaJXtTkd1c1JCqJ
	eKThRi0wsDOUpoJuUtVMEGXLLh8D5ytfBooAfL4r9zZDYsz0wpT1TCpBIuF4eCGPSoZ9TBTcucI
	pOVTkZ+bsEfr/9ocxSoOgSA==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146824785a.6.1790766296360;
        Wed, 30 Sep 2026 04:04:56 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146815785a.6.1790766295693;
        Wed, 30 Sep 2026 04:04:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15395755sm604092a12.11.2026.09.30.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:54 -0700 (PDT)
Message-ID: <87ec94fa-d692-42ef-bc80-9ca485312c88@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfXzbxjvYc1xwfK
 X/zn1FUeV34iei7zysfFTMwSyAMKpkYBYab6PKhYj3JYDeqhAJA3Y+VjOEqXPx8MKN5wMQUO04g
 x1cJmYVskzx01I/PvPp/nf1hWZ4AJwE=
X-Proofpoint-GUID: i-O-VYakIeexXflVZkBVHqBQLHMZvyC4
X-Proofpoint-ORIG-GUID: i-O-VYakIeexXflVZkBVHqBQLHMZvyC4
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcecd9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=APqY-0NjVA1trQotmb0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfXxF3q86QZfcM9
 nTJe0jqOGXOjL0g2ds72kWZ/E0KWJuhVI3f1D9iUCivWC56n04HakpvNgUp3Q77OUIhV2VDmjUn
 9Eq2dAIz8msmGNqHBXlLhqi3wETiXutj+bUcpMDbBmRcVlcIHhKxjfcylav/PpR2ECDzH64yxXf
 9MGenqaI7dt4XnLk57IpK6ZkYSc842DmsAaaxx+0enoleCOqy8XZVA253oaxn2dqBuJkE0f9/fI
 DsFE/IXSDb3r+cwye5nizNSzupxZClKHs8VoxI2vCv5Q22Ol9eETC77ZWCdORQ0MkI3CCVW26iO
 rSQ8hmyyKw1lOwwxlijK8BGj8ChKG56GeIapdNkXLJufzD2CBsoE4TMol58YObXC+SjDnFVbS8o
 70XdBDK/vZX4bUPpY9RdtnMrNAIOlEvGUZK3wyBbOn17MoaCmvyTNR/FDm0NxhU/vWSzOl0EBGw
 DXBTOK0BLpLv8mC/KrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
> connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
> sensor reset pin states on the TLMM GPIOs.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
