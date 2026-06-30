Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03593329E4B
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857400; cv=none; b=BIsP8CL9PlPGFq1BBkitcNn309aYZIsnbBxPtF0ce3GR01A+PJQAnK2C5LE4P7K4filGSSzCHuYl8j8Ykv01nEtqEnOt4HYBRxEoz5Am5Vw2HPproqHWyGYC8ihS9noFTN5eWeK+artLmvvzN7innXJXinlttLiC8mCWmsaiyoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857400; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZoZy9oPGWW9w7Vn+N7w/codJB1cT65gKc/2Yi+DooGsqBEeWg1sYqS9TRggfAQoNwnP19ztDEpzEkuK8T9HgAFYs40mxUz/yRyuEvmnmdC2Caftej5JzeR6SXlrHSw7AS28+E7r8+wFRUTOHnCJto7NdhGIGF3mb0EPH+yXfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRJsyDRg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVVUyqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRJsyDRg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDaiP2959915
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9114hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ea75996387so710106d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857397; x=1783462197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=NRJsyDRgz9XcsskDy1TCStajobjEVNxjDA4Y9JZ5YMTLcBi9FjUItPsUngOQEBg+Ve
         qCRCHUiUpd9V35DZ7oUeLzju31vveARTtZe9HrVhQDCcAJcPYuvJiG46Hv0aZK4TUEAd
         LjXYOD5BGZmYIA39/qF/kHDQRYxv4Ui7o9c1BLhA8bCMd8MCeNNEwUoVW3nW1QOL8HOE
         uRPOEvPot4OpwEeJOWmsxnHopCwAs4RQgWaTZCne0w0DuiZRruYr26BbTeTaohBkIYr2
         bvNdMnDKPbiyjlCms1hLacLCibEbq0ywkqfYCG58x374QsjTl+HiMPLbYJR9NlMCknbf
         2fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857397; x=1783462197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=Duvg/RXpWgNSjw/wMuRb0cneTB2L8QRrK6DCDoVP7BqJC4habvPj2td4XeHnEs8cot
         CRUPqQMww/a20Ut8n+M3sVde9EW6qnl7dPj4Tw011kVnAZY01rOxP+WYwQrn9Uj2GMdW
         +WSO3SeUU+VPsS82ixELbqhip35BGHEOwzFG0o753b9ZFx/0iTxi6nfb+wQZCaWz3iGE
         iY2K5g/MQuVrrGHgFkRTuV4BJYe1w2e3FvyKfQKFU3aNtlpxtfabxIFGliWNCzeup/6Q
         6aVfm/Aw8gYpxdfsNgIfnuFhaHdYUSt0uhtxobBL6ELRT8nqY+dSpMWxIxEjZONlptz8
         LA6A==
X-Forwarded-Encrypted: i=1; AFNElJ9OFLhnFAjIO7Ajv8gZRt75zSHNG2lVUAssP8qwmKeYlJ417JxXilYrYmIFfEntGqaoNN5/tZtVT7329g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4D3Exm6oes2RSP2XbsiHdYSVxmizz60w2JcWrLR7eo3Yf/HoM
	+3QQIxdchFQXyCQIP4AOgwOagnsCYXHXr1HMSq3gWSt76MPrU704rVKCxNC3fH+CCJv+WvV6geC
	ijpu2Trnw3tVIbyiOecnSOpTXMKEuXGC9IOSNGZqUHB9k/dyzGNjCpPu4L+Vlj2uXmw==
X-Gm-Gg: AfdE7cnb7pry3MiDKDUXjwPtqe+1iF1gyBzo8W7EgR1ixXpSEjgbecSaZWuWp2LoePx
	25nBuXhQnE4So6oH1+qeGOD0QLN2yLayrZgIx9n9GlD00fdVKgEzUQt1YecQDqvALctpaqV5j6O
	wph30LcvvmqL/W2D569GyJrEz5GD+rYewSSfO6ArNsxwOf3QLpNlf6n1F1jRMa79t3GPgQILjSs
	WDUHRX+9q01hho9JGMh3rBQK7alt1QyW8BQn+A4Pt/lamC080U1AtGYagb9Jd97umNaDcu+Fiks
	z7S2BZBZYIDdW7Fst5F4aRzE9AD4dhFrfAB8XTtL0FZjCIVBqJzqTe0/vDQCkKLADcLNL098lCx
	QxBDBNwZ81z2NqCVco9+GhCt2F7DA3cEf8PxeMDqT96F7xshpHhlVfN7z7TzeOg==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434243185a.66.1782857397401;
        Tue, 30 Jun 2026 15:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: goCDzp7uIyr0R6YBa2voCkcUInUZbqUc
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: goCDzp7uIyr0R6YBa2voCkcUInUZbqUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX2sIku52GVnDD
 V06sLXodXyFBWjbhZBNfjD9/7brxvv11IPqjieaRf22pjX5PSPr6Kfn2TyvF6okvRgAGbc5qXEy
 NXhwPGWrvJFaZSXxKTPu3EPDzjcbRPHmnw3CE2IkPJ9doue94RLQ3yHebvk4AwO/o7Ik7tvDKT2
 AKov3r0nYwwdAMrAcxidNANuD3yC5J2W+2JzECou5IztoHHFldCeG6ytUF1tVOLxjBy/VYTZZ18
 ubQubDWQw2Cranzj/GRP+XbBeD00HyYjjKG9quHBqsMugMqNLy6AIAclutikTK5svnkOLi3P5g/
 SsbuiUqmHOF01q0hd4LxOCjP+REwZ6KE44h/ZPSGyK6fUxp/dfui95yXxmJBz2vIfDlh0D6QVTq
 fZCemqtfDcUp/MKnhDVwddXOxkKUJi4lJWibmAJd0f6hw5k2/M9OU8p0cp3nWepbFmqV7LHaFAt
 ZgsqnkYMhVRWXktVmGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXwyf2z1pmySyH
 CEX0sLX5vPmpQBL1iMliKJTfTMTdX3Yj3AOMiaOw8zgV1ytFshd2ThPnK5tmqHE2EytTsmQMA50
 KFg1FOYiJbf9UtqRdU2Pq/0oY/dB8Xk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
