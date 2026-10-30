Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378548;
	b=WfTFOCNt6JcorcoMYFKDylEb0kU36c1xCZd43Zm2W7yZxao3W+NzgWwX1IL73cb8w9ti
	 3jaYGE9WxUc1DCbhgfgG19ll331moZrDAqf2ppgAdwzFouAXg+q9TGWKonzS9Uo9LWw7W
	 J1nugEr7cX8n1krSWW2y9tPRbio2Rs7x6MirAkR6YsSUFf5eaSGxqM4zs8KmzKFc9TQLU
	 f33OqLxmASsfG4rfnxxahcORe9aFZ6uMjGR+EA34irxc4Hgu3QOaXhdPj7QCgA2eJBJA5
	 HJyedZXKpj0l8UqsoFA2+qE/JO3w4qz09MyHwAxkWKJXU6LCp625kz4kv5eIPi9yuNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
	b=To98d1/xBxRg47siE4E1+cDdjylb5wacVp6llZTPql1F+sNRk4GQ97vQKrAXsDpvkEts
	 j0V0PTioJIatt7A+MxLK8LM0veR843KNNzKxzDKSe8uks9YIDux+9RDlmrbYTWVIAcqcy
	 VKRmnF6zKnNCHuCxWpf6gBhYNOO6IRiIbvXDZS/8+vcCAtPzER0moyreMuqaTvryuFXiz
	 vgWXovjZahXOkXSBG2JL2TtolBuDCCa7LzqhO5PV6FBS8CkdAk3wPGlqxyTv6piqufwev
	 /hakUfzmXlMFojYum90OWDBdpKWsVmUZcffDrpYAUGCgAWE9ESYjYSJrDocSoka3doA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC996606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC996606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxSHJkUC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbeKqZBP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCjH3564376
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=; b=GxSHJkUC5198O8Ih
	SFnWSUT53ZoG6dH9Yayj4yDGKREpJGRnLtX7RA3nqm+mNj2g1+HV5ahmoXmZ3B3a
	7W90tx0e4RUB2V/PFsJejoe/qQxXh49tXekVD2f8n/j4QlXIyBHaZDt9UKX2Z15Q
	k09XkDyovLji2vHvW7BiAzDzTBuZtiAJIBp5EzZ/Ebri7RjlhbpfhbVQRFxHWICI
	JSHBoYz6hpmjNjFpd+yLZcsUFuSflhVaajs5+X+BPTj+Dtl+fredVi/giyAyGWZu
	2NUU2n9ydMEowgV/XhZuNPdSenzEbbLtfsqwToyBxfANnhaZNTWVjhhq4AKxUDjM
	44yTyw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm0re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:42:26 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-70eadc5b37fso1147360eaf.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378546; x=1793983346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=ZbeKqZBPEpk+WssYYbYsqnCrGXDed9tH0gpmBh+dH1Q257uHUdPvy4EYTvtJF+dr1r
         kZY/L+ZcycM47wjCKjkVM7ByrtqHwJcqd8IHg/jkxagDzTbHCMS4boNbWrRBplKoY3y3
         q/ppnPMVXfTk4jEs5jYM0zb7PXR8sp4p5zO5phrhVeGz4mjm49vjYdmDmyZWw/QiNtbE
         t2iGYWzMfqeEXg9s1wl+X5y4QZlf7bpz80svXM3RX6qjctm9bXKwLAZlYzmjSeNT20eM
         jpj2gAgpSz+sHhxqY3y0H1TsQoj5T18IUYmFaoXh/2tsRGA397og8Qgbc36Ip3CTWKA4
         i0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378546; x=1793983346;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8F21DZMe3A4V+cCXI32wwp1x22mpHQp2eEhNQy6rZg=;
        b=gKXl5oW+elSUOBynCuDIyzKkiqj5XYtAXpziR8/k2CSIMYadXntgtdDK6HkDiaXkAH
         HU5mfZK0G0ZvT89RJarFjYAAnEfmiMUiLkc5gTHrdTGB92PiU+T1XLLgUwwrN8V8gZ/P
         WRjb4jC+ySlYsnwIpIXTWfOevsae9xepBMdwWbH2zD2N4e4x0clxWgOHejYOYuzJ9JBf
         7DDTNYymone7Jg3A0aiszi6alAGj9zGRHz2jO/zpR+C0tPLWOAKJjZAEpiNvWpEme351
         WcNtEcW4/3Xfg9vmrBbNClg522xz3tMvGQ3TWz89OQjpiwW8Mhfi1ccbrGDrdD0DPsAz
         EfOw==
X-Forwarded-Encrypted: i=1; AKwUvBzZJk9eYgD15C/S+Btgqb+jIqzJiygrbMNOIBVOLua1Ez1DgoUeq4ZzM1NrK90kzQVmkx5xvwBju+RetA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFxE97ZpNmovPOHEcYWfadWXajksYfXoTYR2LCzFyuAYTq1dbq
	mAMkAL0o/cwepZ080aQW8aSvN9UshNt7Edw3ktICRImfy/Z4t8pq2TtXc6ILfWEeVmBSCgdvE3C
	QEM1GjfLRAgZ0iVkdv87+cNpAbXoJzqGnbjV8IyJmJFfes8Po1PFi23rNpMrE+lF6+Q==
X-Gm-Gg: AYBFou1zyMxuhFK0RYmAth0pwQeRskHOdn9Ik8kYITyHF5XJDEi40yqfFYP0WA+ZC7a
	UXrDM5T319DUBHdn+P2j7Z+ZueFWlhETifmfJtZ1keOfBS2yj4hUrwapdhq4gaHYAJh/Gni/GYa
	goWuQLgiopLT9YQMx6mmbNzwGAKeiIIf6m8bimTcV0BxAg/4YdJMenazsgYiDJQ8krDhUu7jW4v
	yBqBiKSVInX/hflsNQ7yAKeTAO2RwXSMOGPInGGoxV1qRcCvyqttn3nRtuPRKSzhAuMNE2T/j2g
	/z8MqBISjVyoxr19AyxS16J3AozbkCXz35gEQy4TyMDHOTcSUw1fS38S9PFPFY42xSA5AS+waWh
	PevyVwnhM2zVX9ThaZG/CX+sEknG4fxms/MN4JChxG6Sih0oYpfuEi4d6Ru4f+C1iTF9qQl1pII
	zL
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576127eaf.57.1793378545986;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
X-Received: by 2002:a05:6820:1354:b0:6dd:a0e9:1ed8 with SMTP id 006d021491bc7-714f25315ebmr1576112eaf.57.1793378545592;
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2364487eaf.1.2026.10.30.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:42:25 -0700 (PDT)
Message-ID: <d21ec697-c3ef-4bcc-a74f-128191a417a9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:12:13 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KgA-rfojeKi3UFX4p-bbShO0nhCzxJuR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXwuzhIi/TCpAv
 vTu7FqaBqOGvGpeQNwUCDbnm5oOmGAFbLY+m24mKbwvTWmGXaEGKVaNHg+oQ4R/8hfynpjZVQes
 8VaTRcmHVJ9bWcxx/SjX8OOdiHSRwJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX9O7lwTG/FB3K
 sIDzWJjU86Ew2KUCsykUuqsDg/PDBRk64xROGSePLV17Jx5j2JfT06TRG+slaFw1Fk6y/+DABH/
 h8gXMIDQcG33dXXBOhmXknAEZdb1ruJ3ZLQeR+Vqu72LHdL43C+qI2doCXNu7FMa2We/h81Vbia
 V6CUyma2gv54qWmsA5Ye/fIze35m54aiB2nRnpS9xSTecwu8SHTUTwzpMovDjCG+Q0J5+1oHiGs
 EXYJzMMWuxX3MZqga2fJOc9i0paWXHBdIreAvh4nVLMPnEVJQmJn2piWKZRLLh2d1AJDwrNGxmJ
 kYsH07jApibPuSIcPK+ROXbu/26uQGYLd7Cmn05UyI0aURn1vkAvFPLaXcat70fWubKj/Gp+uoZ
 HhrZQICVO/XPgdELh2TOpPCmI+njvYb54rYH3Eg+LupTofa43x3fxEvDaJaauhuHTZeHbQm66rC
 sjZI4iRBLesSEmk1RcQ==
X-Proofpoint-ORIG-GUID: KgA-rfojeKi3UFX4p-bbShO0nhCzxJuR
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4c8f2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300066



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

