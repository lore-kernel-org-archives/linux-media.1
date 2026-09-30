Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DE484888
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764407; cv=none; b=c6k/2zaf6So3Doz8UjV/xkAS8MomMK0jgobv3Z2XQdUijF7zE1ayxvgwbVKmEjSEpDbsZcGCZWQUX/JJ/3m/zJw5kHLSkBf++vLfK7zticaXekFIjdBv7tYqmk/jhbdawpD8NAyy6UZxt8XjE1o3iNPIT5EVK1sh0mhgbeVdVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764407; c=relaxed/simple;
	bh=p0rtOpqJgYOdzRogUQx4C72rBJ6MZuOxyLFNm8hD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYXxM3h8yAYbLUVNMrR+BJXqcc3XC72dY2xhrJA+7msgzVhmpGa7XvR07iXws8v2rpL4w290jQQV+sylChOvnpYL8Vt2+NDVKgv3971LhO1uekbRHqwknE0Lcn/zN8kbgdxvftS+Mi/XsQUX1igoDpNdC/fnP61C7MlRFgDXNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKp3pkBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9UPHw4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKp3pkBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9UPHw4O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dS5v2666965
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=; b=KKp3pkBlG9NMn4o+
	Ie78eIItC5nrJQHzevcTluOiAL9eL+IM2U1fu2POEr0CPh21TWhoOJoh/3q5xDXF
	oGg+oJlL+dI2NFnXoFUUlMSBjBp60SqqKSFox2b2bJbwcfSM5exKxEUmjtRAGLBL
	KhrNGk++ecMx8H7H+ns1IWmdgdFnVfICtwPauN6XY1twkBNf1rQEAFAl/jCjHkat
	Hw76Q3tvDqvnBY9isdhW8J7IrngXZFJEiUzfcInlBymyWWJftxE58SeNLVzsvFhB
	foH8mUZM6lr89VlWNedjUse0YSfwmOyOdW4+7fjcSwA8Yuv7F2QrZw7oPW894TGp
	Z2qUgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27gtxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so100825885a.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764403; x=1791369203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=I9UPHw4Oiy0auvSlwDAgvpMRNKOkl4CGmhHQYBUJ1vNhgEAf6nSdUrt7TgnJjfVEGQ
         mFctZykjxc2qzkBJlfwcrIB7g4JE2ju04HcQp5G+kVd4cqYcDyv5LTLJEw5MXxug9zqK
         WiCXQayR+uq4Zk6FHAhpTlwUAtAeMtEZpLDpDWmt9vNZkEWI1XJ2TCSxQ1prq7NWMEDR
         bt3O3lK0ljQv/djHBD2Qp++pZPY6qIfTKA42gB23ni48GU2i2H67UgkhlTEjcrSbkxmc
         BZ7Yar++LwPVSRFO8zoNnwjNXtJEtqxDvSiW3Qw9J4HAqmSM4i42Y8IFo62gMMRRT6WY
         yvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764403; x=1791369203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqw08WhSNuzNavRYsHvqJW6DtR1r0AaDDdoOSLKqQU=;
        b=0lfPAzCkfGfFkIe536eG8nz33O+p6KJTtFgM0J3FVMAWC3LkzjOtZ40FrzZS9sO0yt
         HFVBJp3ly+oj2ssiF91JdkUVGH3eO1PnE56pxe0E8XHb4Ne3rtoFrkilh8iYBgBAEoYh
         w3vQRyEgm4n08LGiWuwu+KDZ+2Zbi5CvH/3++oQ92H19tp5oTeDY21lquLNmnzcUYWSA
         t7eNseF89QbVcEBGSveC8lIQavAamvXfE3QfDzHdc526x9Od/QsEOtQtnhFgSsNeGOSo
         xK050hh/Jv8AaoGykIkOz3Fc41sPzZ5PqHydekCfJT7Ls0TO/9I14dgEyeyDTnsip8EM
         izsw==
X-Gm-Message-State: AFuF++ndur/9Le0+VFob9F7f5ZzwUoi+LCpVTU3834NFvXQAHQ+zTeF1
	xpevqqUkU8z5xu+fHRRgZxoPmrddXKqwl5lBmqz2UhBVK1ArZ89Oq9sr0pQiZ1H3U8H/KO7wBrB
	W45cgmGvIcvat2hYkuFLS0K5FLdjWe7ewMVz16m3ntIW9cw/KyQuAUoZVr/UnECVE7Q==
X-Gm-Gg: AYBFou0CRyYkHIArasZDT0JVPsy7FJ9tluovv+xaioyBC0l2mrQkcqGyBIOYEvI1IxB
	MQ74CmrOa7RBLsEQPZi6g8wZzEU5PwmuE83B6PS/wDJoS24M19u/XK7CBy+1g4YvdWy6w5P1bZw
	UcJHrmlc0p4iCWbtzdzsoxU4HMzgVr2OYiChvUTm75+0Pv01oxcc1J6RRTKJ+pNXxhUZrBqTETc
	b+YK3wVJBUwHrFTCc9Z5w5uyWvsarCf2WbLWI4O3KKiXwZFzk+DLUzqeMPDn+n2wASOTl19zL+3
	3bExJz0z96xPbUat7OQThmpkqpn/SrFFMHLr+Ap40Oe70E1vrCxbiGn0eXDaNQ9vKsd8U5pcPcP
	Ges3q4L5DFIL0B+m0++hC2w==
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144983085a.4.1790764403236;
        Wed, 30 Sep 2026 03:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93ca9756a48mr144978585a.4.1790764402614;
        Wed, 30 Sep 2026 03:33:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:20 -0700 (PDT)
Message-ID: <3439bb37-0aab-49d4-99af-8c2b22fc4adb@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX9793FyeZEvY7
 M+GRC+nLO6oThCGVR9IGO3eiXhSQauv+twvldKKKBtCL9lXA4VuK47zFb7GhOQXyCSH7fCxA9E6
 fXf0GDAznhsntXj9DYKkD9GMSc8I394=
X-Proofpoint-GUID: K_tppXDDG0nNxLwZnSycLVPUBlVMbDUs
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abce574 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX2l+zV6b5jcCe
 /PjqIUOl6NzG8Jw5AZUtbBxxkD5Q0edjBkCf+ztaI0Bju7TcQV3XBZFEjK6WDWjVd+gCPBHOOdH
 uD46XlPIpkpLWUPLcOC/sETZwbKcnOawCcywXo1CLHZu0QI1okGQc5eH1jT3WOm0xW6LqK1q3XW
 qGGS/xXlWw/Q3TiLbVbMFPwFboYpIVbE/d5v5mrojk20KwjW1vz9QNcYdT7Ldy7pD2mF3nyWOa0
 Xds4TzfilUP3mj8vG5CKtXiWblcDUO3gd4P5hwjerhHj0Bf/u//8gbEFBBA5QgN9oUAYH8e6qy9
 /3kTWOH7Nnjb4lkrv/5Xp0paIilxrZg2RgRD1HG6nHmv4lR4MbrA9v69IslNFPLajG2hIM8Wurm
 1nOrwQ5oZfc8QGavTgjRg3q+4F63nbfYQ3/Zdza65j+u8CILUWXgt5IQa7SFs7BBjHk8JCGXfh1
 yfmUJHhYt/Dj7K+B48g==
X-Proofpoint-ORIG-GUID: K_tppXDDG0nNxLwZnSycLVPUBlVMbDUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
