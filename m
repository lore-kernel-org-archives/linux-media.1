Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127624;
	b=DWyXeS/lr6kPfRXTCwgpASth70PuyqJ3b5rF3LavwBIv1HTHD1T56EPQGQNtY2/bybuD
	 SNq4q414F5Hzm7d6ZaNXpY5ohm/V9mzArMNro7+kM3eCp+injRaQJ3wro9811C/ih96uA
	 51IkjVTx1PrlhKC2If3l6fms2Dwl4zHtunR6B/vswPVLfB607o4BtOOb2H9owFY0CRwKC
	 dNu6FA/zkf2XsJ3Ud9bMOED49Btx+JU+J1up1t1fd4Z9klxPWYmZSzQxtY2J9+qVdJi9p
	 R/wneHRrvj+45mY+tzGiC9Uvg+Y/qX4CPi2c7SS1V+iMAc46k4Z+E0jhOATuisra+eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9unBBVCj1rq1r5sgWlat61FGRZjlRLyVT52MoM6b320=;
	b=tNBoZdDhj9YUeZIGkZyEw2bq3ntyFks5f1vsOQEAXp41off7AqrEHH46bV5u/42hV0hw
	 MVZtUdHrrWXBj7ZfkpBM3gcRfp6RPFsSYmGbvMiYzylZ66HxgRIwM55GbvyT2r7T9AyXv
	 XpN1iF7y47mXHVJxp/YC2nPOKXoiDfZ8bmwiKbCgFykQyOd84U5QalJpKYQnFGD88wH/U
	 AxV8pUD8m/DqWGmXL3owL24T5i1HAScAZJdkEN0qJ/BMeg1BDlF5WhC+oVQM8U1za55Uq
	 n2ZBnOzETrwSwkZSV6pLrOiSCguhMiIPLezhXbn6qjA+tsXz9/dpAtjZLhzg6uFBirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XO9m6vCM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZHQBuaJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E979606A325
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 22:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E979606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XO9m6vCM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZHQBuaJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJL0iIH3452824
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 22:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9unBBVCj1rq1r5sgWlat61FGRZjlRLyVT52MoM6b320=; b=XO9m6vCM8dsgttD+
	J51Z36XvWNDtPwwKtOzn2MRz2fT0txoRaiBABAOlVqf4XWgko3WVEuoiiuT5j7HM
	s+1QpQElaDueDqck7SiDBwKTb/FMnNcd8RV0igtcqz6xVdBhE1tlYsQV2IuVlj+3
	N3x40KGeIcKo+0yygDSkV9Rg9Hi6bJQxsJm0/n25l9NmWg+1BNEY9fN25RSr5aki
	0EEdYbWPI3AK9ZypwbTZoHei2HJ+bKt44PgM1C/dr96KM5yv64eKB6aVHjLCRYba
	GcHdlnDAsBvhLVC9+1Z5UJWMUH+I6/li0xYj9jVZ31TdvzKJvlUZK2QlS8oCoIGB
	OsWOIw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fygqdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 22:33:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso284190eec.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 14:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795127622; x=1795732422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9unBBVCj1rq1r5sgWlat61FGRZjlRLyVT52MoM6b320=;
        b=gZHQBuaJDDeojryLSvQ++rBtbhjDZXQCHF1Rxa0xYg8IYbCYEAHwgCflUnMKjz/AU3
         XZnG7fDG8LOgOhhblKRZj+gpQBcSlx5h5zIbzrTjjiQNLvcLakwuRCPn/r4rNe9J67S4
         SUddg6c6lvttp6+WoJX8saYYXPry8piAizZFWGFbK4EtQkDx/1p/mXl1t8vD7S8t7cPX
         dx28PX6OrljqY+7GAIYw4EN0IQF2NBW94fdQxxsX3JebhtwcngaEII5K5Vu+KF5Vg3sv
         dcB+4WZ90mNvBgDTM2C/wkoxGmyN+haaRXaPHQ9PaQwrjZbfH5RWBTIIiPFF/MtzmkrH
         UBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127622; x=1795732422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9unBBVCj1rq1r5sgWlat61FGRZjlRLyVT52MoM6b320=;
        b=bkoY4hkQ+/Srjs4w/WrCB/oR36U8go8zzq+RXx0Co1RXz0CI4c6L5/HrlcgypCIntW
         f8NgroO0Fi625JBZKsPoJphDOB8AKGQWaxEjo1KocimviXk0EYL5uJzNpw1itvuRyABu
         rW0ep3A37z64s9wbYf3kuPZ6KwWCRqN4lO+VlkZD8yPOtnX7OR8FFSVaiPgbfIhnEgjv
         lG39h0vXo4uwjBO/9jhCZCYNORgutoKQRUO5ZznBJ7na6pTbmpztByXoqFnU072qfo8m
         djV6ymdT/tgbE0MKosODexEoVJ8XpHSDczv78tgBKulYkOOTnr+FJEQ5rPwsBOL7ZF0o
         jmUQ==
X-Forwarded-Encrypted: i=1; AL+hErF8eyZjCQelQB3VMG+oOqzlNX6FFn+JSdVaHj63alsC31ChUpEJD9QlESfuX0OO4nwqC2SpZDhq7ElcHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8b1r/4auWqnYcOZykig7w3z85Dwb18z+JZCHpWOLRqOCBeUSOg
	Os8BbN3RogKF/2SdagumnkfzrOBZpuzHdAqRzuvp7Ywm+WWoxUh/qwloLEjYjKJpaWmxNg+CfjZ
	hMnF/v6e4PiIDyWpauCPjk+PWAvrWKS5T8fKnkoIIMNBe3fbX6YSJDNETKJ7kUjNxng==
X-Gm-Gg: AYBFou3UfhZV4ciCzhdc37gi4QYtd5TUMF7qlpR6QV1JuydrbisMkSQ4b2P/NvKI9lp
	UjmL8wfKBXU6ACLchON9qazITJkiabJevz1m4GlGDv0zG9PNIIx8mxLWSIW65R8M3bU2acq9hHp
	8jwD3mwTt7OO4zzRr5jCy3SgMIxYPQWNwGXeEMDOgMqw7+FVXXB+NLQYgXnN0IU1G90eZmzVpxz
	gASYMlqWn39xRQFDfECh3VabxxvBSpz6Ni9r1se0Em/is3YCXSnFz5v9c2Xkh7yvhVfitQmtmF7
	AVqv7jsmQ/T77yepEnskmoDNnS7KOHepFGe6K/LjK9AtVY/EYmnUIrhYul1rDUWDGgu/jh9k/IC
	b1W7I2tfZEbVzyVwAKq7xNlwTaznNINpiiUn7zidSfZ47ttDdu1XqJoksFNZx5Wo+vistKBUGvM
	v0UAtbdI8cAUwzZ70uBnnITxcARd/cpk81wuc=
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr822977eec.34.1795127621825;
        Thu, 19 Nov 2026 14:33:41 -0800 (PST)
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr822943eec.34.1795127621289;
        Thu, 19 Nov 2026 14:33:41 -0800 (PST)
Received: from [10.71.186.214] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm1494360eec.8.2026.11.19.14.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:33:40 -0800 (PST)
Message-ID: <564e8e85-3991-4ec7-afc3-317dc8732a4a@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 14:33:39 -0800
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
Subject: Re: Reg: Re: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY
 support to CSI-2 stack
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
        wenmeng.liu@oss.qualcomm.com,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        hangxiang.ma@oss.qualcomm.com, vijay.tumati@oss.qualcomm.com,
        udayc@quicinc.com
References: <d78ab29e-8751-4356-a801-d56d3782abb9@oss.qualcomm.com>
 <3e8ad5f6-fdb2-41d3-a944-3f3fd378e657@linaro.org>
 <6ec4c83c-cdca-4137-9de3-81abed60dbb3@oss.qualcomm.com>
 <c9271d11-b5de-4a05-9214-8bfe5a6ccf9b@oss.qualcomm.com>
 <09896b0c-b670-4d34-82f9-1e880a9cc188@linaro.org>
Content-Language: en-US
From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
In-Reply-To: <09896b0c-b670-4d34-82f9-1e880a9cc188@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5MCBTYWx0ZWRfX1wCkFGhBKQTW
 QH7rO0JiprqdjyjMYp5qw00en+8DvWyMsUlcHpyLm36V4GNQixvHPsKpQBZ3aGoxy4wDWCee+A5
 y94s4eOdlmPek0ZNx85oICImlTk/QlE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5MCBTYWx0ZWRfX+chWJsUSLrF3
 bgOYNjtGjZp08Mc8oSR9U6IoBKLCslaziJ5LNLqrLDyMuiyIah8AfEuHb7mAcmeKkHlvj1sSMwQ
 vnDuzs3Cz0dKyKbpbzBLg6BQL+1OrQCvR1jHGn7fkiY+FUkqqRdyJRiKDE/4t7xo0x7AlFM1RKj
 r34a0iJbwRZMMlGWoMxVMiowPA31eiWyjMqJoTPDFMQ4TZvi4n8WcEsTh1Wu9JNHCxPgYumGQgQ
 PZrebBtybewcdd7rAylzuYIvFORWqVsXP15GzCkhzJB8466du2mxXRk2zpiUpCS+59YbaWa/NTi
 uxfz6XM8MaDEdeHcl2ZxOHdMlG5exalqAED+uMJ26lYU9KtK0CQDQMWrjEaruq8R6vCO6km0E7w
 DssO64q3TOcOyB0bFxP6XTT2Zzx0NRXZXQuR8ObAXh6oAPikHG68f4THRvKmdCj3rfg/tAZmeS6
 0skkX1JUlWjuhUIFYtg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6aff7946 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JvcaA5m-eIxXtVPHYhwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: X8OJ-VMs0mL_JQxfvqBV4OuOWgeoq0aL
X-Proofpoint-GUID: X8OJ-VMs0mL_JQxfvqBV4OuOWgeoq0aL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190090

Hi Bryan,

Thanks for the feedback.

The original proposal was a little different from what was shown in the 
diagram. The intent was for phy-qocom-mipi-csi2-core.c to act as the 
interface with phy-core.c,
while the functionality which is currently in phy-mipi-csi2-3ph-dphy.c 
would be generalized and renamed to something like 
phy-mipi-csi2-core-utils.c, and extended to support additional PHY modes 
beyond the current  D-PHY implementation.

However, based on your comment, we're now considering a simpler 
approach. Rather to maintain Mode specific operation in core-utils.c file,
we could merge the common functionality from 
phy-qcom-mipi-csi2-3ph-dphy.c directly into the existing 
phy-qcom-mipi-csi2-core.c and evolve that file to support the different 
PHY modes.

The PHY-specific pieces such as register definitions, mode-specific 
constants, and related definitions could then be maintained in separate 
headers, for example:
-- phy-qcom-mipi-csi2-dphy_regs.h
-- phy-qcom-mipi-csi2-cphy_regs.h
-- Additional mode-specific headers as needed

With this structure, phy-qcom-mipi-csi2-core.c would contain the common 
implementation and dispatch the appropriate operations based on the 
selected PHY mode (D-PHY, C-PHY, split modes, etc.),
avoiding the need for an additional intermediate source file while still 
allowing us to extend support for future PHY configurations.

We'll put together the proposed patches and share them, which should 
make the intended separation between common and mode-specific 
functionality clearer.

Top Level architecture will look like below:

                  camss.c
                     |
                     v
                phy-core.c
                     |
                     v
          phy-qcom-mipi-csi2-core.c
                     ^
                     | (#include)
      +--------------+--------------+
      |                   |                   |
    D-PHY.h         C-PHY.h     Future Modes
      |                   |                   |
      +--------------+--------------+
       Mode-specific register headers
         phy-mipi-csi2-dphy_regs.h
         phy-mipi-csi2-cphy_regs.h


Best Regards,

Jigar

On 11/19/2026 1:12 AM, Bryan O'Donoghue wrote:
> On 19/11/2026 06:37, Jigarkumar Zala wrote:
>> Hi Bryan,
>>
>> As part of the C-PHY enablement work, we are thinking to organize the 
>> PHY driver such that the common functionality is consolidated into a 
>> shared implementation file, *phy-mipi-csi2-core-utils.c*, while 
>> keeping the PHY-specific register definitions separated:
>>
>>   * *phy-mipi-csi2-dphy_regs.h* – D-PHY register definitions
>>   * *phy-mipi-csi2-cphy_regs.h* – C-PHY register definitions
>>   * *phy-mipi-csi2-core-utils.c* – Shared core implementation and
>>     utilities used by different PHY modes
>>
>> Conceptually:
>>
>> Plain Text
>>
>> |dphy_regs.h          cphy_regs.h       \                  / 
>>         \                /         \              /    phy-mipi-csi2- 
>> core-utils.c |
>
> We already have a phy-mipi-csi2-core.c file so why does it need to be 
> renamed ?
>
> [141] % ls drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c 
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>
> I think anything that needs consolidation should go into the existing 
> core.c file - I also suspect there is still a use-case for 
> phy-qcom-mipi-csi2-3ph-dphy.c and phy-qcom-mipi-csi2-3ph-cphy.c
>
> But its hard to comment more without seeing what you guys are proposing.
>
> ---
> bod
