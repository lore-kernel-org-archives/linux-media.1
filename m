Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A63AFD06
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767063; cv=none; b=MULy0/y57LB+pw+AAPgHmRU3ecDDnkijv/907AHx93Vx+5T39JJEtU3vKPIbgf5rPulTbX2tZI5x0WKsDcel9blIqfOYC2Un85b+d6k9jPVAJOwi7XG/WFyUggLC378qDZUToDw2Jr+FNFRTFlMhJuEOz62sLWbFmup1WKmxmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767063; c=relaxed/simple;
	bh=EeqgvxyLfTni+7IKc4kWoIM6ayYzhXt4o9qX/MOfp4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt0dcjhoM+klezeLvpKhWB2Zr8jlwppjSN7YH2WhsyVEfOMdoeoeoJVPIIQ/yCtDdHJwQQWlYqfrvomtfWzUHH/vJ2C0xQy+QVXUUTG3sKTXVEkzBN7Tqa0e+dbm7ndSMkh81jH8UOhykODGj6/KaPQv+Baw1rh94GQd1+itXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAmalE74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSjwxPbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAmalE74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSjwxPbq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7bTJ3135733
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=; b=MAmalE74m4oGRRkZ
	YgpBQMEenKNVe2j7WtcEurb35fYnSCR7ilC5hYyibKe74uJ3X6RzHM6bj79DU4Cs
	/iF89I4rpvZtwroibcOs4PGkoDgA9bnHbDlLhot6OmuYMvLRBclnfhAeZpBf6B4P
	wRJ8Rx/srv/10GUtUaelmBGHdaIYS20C6mTl6IC1uN2FgO2hrUIImFsbhqUA8Kcb
	rnfnJtRho3OB5h6vwihZhjp6Fw2Hmvm5ax5h+mdci3Q0QX+kcT1G0sjgmdZEacqf
	ZiJkC3eQCixEUMXYhKauFsS6AQW9hZIAhDrxitP4DbPgNStv01BQTlFwiVLUbrm+
	RQ45WQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27h22h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:17:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91202bb99d1so7804996d6.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767060; x=1791371860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=WSjwxPbqaRfjlvBig4tQE5Nx3B5WZrjNOMpnl8ZhSxHJdGKx50Dd/0aj+EwJHKLV3M
         jl5SqrkIjJoFOBn+IVMkHemyZjD8Tp2ku8Uw8cxDSud210MQNtPhhSp3i/Pch6Y/ETiU
         MNQxpKSG1ITSHyFtIwZZAj2GMXsIPOTdeg6qPg1DuzJIL2et+9EE4AoiUEuxpg9XRIxr
         tyJ6YvvbVXzAafe8eSVMnvnRYyV3YhW/5AVrZSv8OFVp3HJkKhahi0R+1wW5R/p2Clxh
         KzSOsH9JNfyelRxho9jkK3JpFmJIQjRAGHcjGdX5dWvA53s+rsLsHxn3B+ZaI2PYvD9i
         XzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767060; x=1791371860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=dUrGlE8yX+DLs216qdvXnCVGFsAh4FGm40N5jkyZnofHGVVf58958hPfqXWVUTrC4y
         ZWsO5fMVitPMH8YgoxEByLNFAMFVhAN90a4oHn5t/rucO7QuDbaI1qjw5wOrnn9iYr+H
         iOsc7YCHUrUZ1knFVZv2jt+1p5CChHI5jYCaTD64sTSnGNN8uSbBT8X5pS8T89dI3Mi7
         VF2XLW0wo5x6hNKe/HHMb+F9SbUZHjrBi/Ilyp70n2J3dFuH3iTVyiRIqCt7fyIc4n0G
         441FjzBRSRuAy6JuQ3xhkbu+KcgfOiis2YhF5h9Vr07Dl260imdIjVmuXqZq9THgU5YL
         VdZA==
X-Forwarded-Encrypted: i=1; AKwUvBwDlr8ep3Nh9PU90iET2bhMMwwXmACIJgiy036KK/DkHvwVspeSP9ddcQlst6wqymeva8zzcx03QtJctg==@vger.kernel.org
X-Gm-Message-State: AFuF++mWzEWlZ2KzKK6UJWTHjALSb5oq4US2iGCXdG8E2gi7ZUDdP65N
	YkvgdvOtqQIuGOwg6ve4L83FhlKrJzrvBoR3YPREx26Sa0DN6dBkoscMione0pS2icsyP5WASbr
	As9n8aYb73r0map76oAcei/z3Ajk0FbB59wkKsrk6rUTGLV/ZFXcRTsp3ZWTBUi6jbA==
X-Gm-Gg: AYBFou1gRPKaXMuuuaYOn6eal/lZGFyVs2EtborOc825JZJ6oF+ugc1RICnKKzuDAYh
	aeiT8qgVt2WUXjPGTzFyjZ5gezJjDJls5XdX97geRxJtTbnlhVww4ek59Hx+rkCehjCnvs69hTu
	kg61KjtKxCncJ304pIQ5gXZfJd0IhdHFsGGR5b61jguHUDjhqsPAqxtNeiUebUgAUeMM6DYm3ce
	BA/52dhcLia/V2c4aYwySRlWuCEjhUhmwpbxVvS8T5DeWQGvilKfK7tk+yj1ajrbSl1j93RihpN
	8QPrIj3MdcPRbHS9rlV0fzc978EI8owvzmRzPB3doYAg0X6Xg6KSudJX3bF1Y2af2QGDC0mphMi
	hMGh08Krm/e0fs1wzU8DztQ==
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133007885a.6.1790767059790;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133001185a.6.1790767059096;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1558b289sm616849a12.15.2026.09.30.04.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:38 -0700 (PDT)
Message-ID: <361320d3-4c4e-448f-b883-1f9d6115f7a4@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX8HHvjNN072GO
 6Ec6QgujJy6PBlWVmGb5JjvKeFtltL6ncBUhHaVN8/iQanSioeojBL/kf5QZPPlDWagxIfknHIh
 RZ3wuyPPzVYYSUpFUGZ+l8AbTTnuWL4=
X-Proofpoint-GUID: sGMWDtRJBADGZelXrQM09sK60PThX6Co
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcefd4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX6PULvfbE/aby
 jYVc954nbbxEP+51PyhreZFm46Uu3iGEo7C8rMPtrhz01KTIfOyA1PNqlhjiCJQn0Tq+Pej941G
 6eUqGXOdEQLJdW+yAxjUgyr7AH+6k65ixS139rPhcaPPFuE0/ROJ2euRe2SDYF6Bp6Nnh8ZlU6l
 Zs/tyVrJeu0QIRI/4gWng9A0JRX429KbQAJacpy8su5iAnPS8q2y8eibXkfFk36lHYsl+F4Iq3A
 UdX7g5xQR6iaJqkAQLuN+h2i7J3x1bcLeJV7Q4pxG+Tx2Qqhoc+WX9Lq4WZ6TFkFLVnPttDpqnx
 BWhtQu9ojVjWd7XrgEU+GGz/8cQhQDabG6V4xKBqafOJG5NEsokYR9bCLr+HVXBSQioh+P54/fw
 vgzTa5zlwAXuTx6Njurx0ZBdmrHRmYK9btNi2A0DQjSbKedEY4RAK5W5zAehHr8s/6JoB8OWXS7
 fHvxPg38RWcyLOxWE8A==
X-Proofpoint-ORIG-GUID: sGMWDtRJBADGZelXrQM09sK60PThX6Co
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
