Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1A40BCB2
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153519; cv=none; b=qt4hU7yaUYUYhJqVZRj6eG5Jna5U9g5OLh0A8ZGu+wuLtH7nzIj3nY35gkjcOK/VYsSxKz1NVB/gh003JxDHJ5qJSkNBAtwtFWapuo6oixcwu6bKcCuE65Bl0WZog6zN9W1KyzFiecyz+9PMpEKQo6Z/49sYckYThQ4IHtP23nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153519; c=relaxed/simple;
	bh=dc+PAuzSp05COzPTtZ0GpZ7Q2ZzEoUEbj829EqBWFyU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B3KlmAEJ0ICvjD2dBEIDwkPqzytcfmkJgYE31pC0mtoKm5KH9B6l4D92bb1Kr4fsn+RWeIpm9Csn96al15GlulgXgorN5lzY63N0NAr08jMwaL8EP08Manzra3kM6MepnnEBK6dtwyDcnS2XBEYD5478AyK7/OwiIPdOjRtkvHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZcrHI/N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmSMo5zC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZcrHI/N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmSMo5zC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAPfd2496922
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=; b=pZcrHI/Nn21/Kc0N
	jrfmdJQXG+JchReAoDZB7DGEIM8h9K520r3Saz9pktARjYxC0gp4Fpghm9zpRB44
	soA0Wk2vNmaB1KOM5mxDOkV8Of4sUvEDLfT+Z33qresL1ne7zM4bjQj0OkEoNj01
	9XI4c9eYlPjYf19X3KOoikHz2MOrsq75/HXS1SwN9uHdgBfHFiwVf1avQ5AWzbIZ
	2Nu/C+RRcfcBQSJs8zXxsGCKJyU3HoBWCBnscsnZmCX8OzOXdH1wYoigZcl+lW0x
	5WGJaY2P8fplPqmFKTqtTKYkorYG6p9BjFVhJjOpGWbJGmILuJBr8ZJ1v6fup4GM
	2ChiDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3p3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:25:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so3015211b3a.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792153516; x=1792758316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=;
        b=UmSMo5zCxrb/RxcQfrOZbF6JpphEvaCITMeJQlPZPBVY6dLnHaHn0x9GI9LGmAH8Lc
         h+6heoT/39yp/28CF3L2iuvr3w0Qu9D0B5j9s8CGTc3CdDvBMe/G9KyqrYXrP/lYN0sW
         t4578fnR+Zq8fIAwB6UJ/1978VzgMBnk+0TiLyPGfPUnXwN96YnTEVH0ILCoTEJLi82u
         yeWbhZHXdJVBXkFK/5aos9c5p5hc73UjjGIYL5qfslUGSBd9riGZY1pY3LzS1Q8LGH1W
         zll9/Dt1ZTTk6HMCoXBlteRwOXyACyiSzneU2JgaWo72M8mfHyQLMkTd+i17RSCMEMh7
         oKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153516; x=1792758316;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5KKnw3ZnqYuCdQsMnmUoivXJzAJ+F0aigtmDLqNde8=;
        b=CNwWXdt5XZVcZ+UA86hjIgMNrOkNNM/YNXoCki29xYg+FrSozFcFY1uar5t00zeRoM
         Zh4c9HzpJrgi8EFFADX/i71YIvgDRwcUBdi2QGkpUOpVgG/4/gz4g6oMZqOIVumusNBc
         gHcR0r1A9xBeqXmvq6H+c7WGPM0R3xh7l4R/BKGAVlDRGTy5tBpu5I0X07wAunzfRHmG
         CVN9Gc1wPw0q56a4NLX8HQDHGVSCkLlG5cmqQnScQ4N5cBdZTvAeak7jeDV5y0QKTWru
         Abln5hrlbJq2k+eXtktK7SdDYy0YKoPqOquWzWXidZu2fXS43wX5YHDA0/hbCIELfkp5
         Xidg==
X-Forwarded-Encrypted: i=1; AKwUvByGGPlhwI/xe0kpNCUCjx4R9Q2kiZCjmPPW/hDXufL8mZR/ZVJop/lxRdyVMLlKxLpAAm899MZx8C+yLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAYLhYFAjyjQVJ7AErEZg0RMSudIfM8UfyO488WoSp7Dsr/LVf
	1qs4ToN1ihoh7h1ZuoU9VhRxUp2PSsEQo6q35lgGLb0PCPZbIdJwXzBNFYH5FnMLtSRAUGI4SYP
	NsEc0wSBcrkfyX/QeGcurrq5EpkEJocye5//eeJU1APENb/YxpgBBC1pxaqZ1jpG37g==
X-Gm-Gg: AYBFou06oVzGoO1jk/eFlfyGkizRGl4gsIHnkb2oI0FI0HyfsXc71z/X1oxz4o14U5L
	HpK/brkWUX+Z/9VvEvxCQzZVnoGS+2UmLipZ/KAV1qvAzRBv3FslOcZYrsXCCb4irjKi6iysrjD
	VkTqy4CwKTRW8YIw2OoYIXixbiWziIPZz+15lsk8bKpRBN644owG15xFdC5tJn+QDdCE8ABHZ9g
	T6cC66wc2cnNOunfsmPuJ78+68BdBY1OYZeZgGsPALmUPjL4dp1r8rGhEXRDytaJcKSG661gk0z
	QOodwcGGKHYzcZY/SvtlT9qw2LQuRZQjfoFztowyeXFXcVrkemkyQK6nlB2NHwAgXi/dppZB43R
	SIEupUIKtgX6IbYiyChAVSfUz14E=
X-Received: by 2002:a05:6a00:4287:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-89e779b0f37mr3987798b3a.6.1792153515607;
        Fri, 16 Oct 2026 05:25:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4287:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-89e779b0f37mr3987742b3a.6.1792153514715;
        Fri, 16 Oct 2026 05:25:14 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57268ff1sm1007172b3a.22.2026.10.16.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:25:14 -0700 (PDT)
Message-ID: <05a03228-09ce-4521-b596-4e9ece57f4ac@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:55:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, geocausa@gmail.com,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
 <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
 <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX+rdJE1EhywRT
 6SEwU+mEPU7ANC+6iJfkRlp0n4Or/sVe39kShl2bVq9SNwYDCkSu1obMQImtYznZlK8r395Pr0J
 FprqbKm3QA6L6wbHszIS17LnKyUBE+Y=
X-Proofpoint-ORIG-GUID: 00P4BfLViPqdSeCWyXLQYz0K2iNbO4J9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfX25y9YUCHuHam
 DQLwy1zy3FEvQ/7jY8/IRbngGhgTPUy4QDBsNXQTonADYUCyNd/oewZ8b8ky+4lk4zyraFSTInw
 vO00IeNeulZgmIv6+UBYVgnu3w8+3lnPZuGzNoN6M1nALcHV6wA1GC7ZR1ImpeRzOwt6m43eitU
 vlN8CvCjbXM93JFMlBPCxmSi5ApIHcFUUsaCGC/5bEjuVggGm9aH6kSsotXLeuA7WAtdO2+pdth
 /gAsIpmoGpi5l5lW/iR7PRIZ3R52ouyJEyyTcJ5y7/+rVQWLnxLw5eqz0RAd35AauHZiNfL/+KL
 wyslDr+hwr2KudSNAGpBfdhML4ECoihVyXUI2gyFuc7G5mvmVvJrYbIVpLhykO2IZWQJWdM/nPL
 ZTc2E2PmLhx3H0ZP+DAUbCNr7EatXgLLmOTn/oagzjo89Gnj5D9B9TfVOHQSDrXZnjbbxCbA/4K
 jof/ZYPVM0Ffbn3Uk2g==
X-Proofpoint-GUID: 00P4BfLViPqdSeCWyXLQYz0K2iNbO4J9
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad217ac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=A2W6AcXvy7-QRKLDUaIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160049



On 16-10-2026 17:35, Konrad Dybcio wrote:
>> Can we write the delay value in hex as well, to keep the table
>> formatting consistent.
> I don't think delay in hex makes sense to a human reader
Okay, that's fine.

-- 
Regards,
Nihal Kumar Gupta

