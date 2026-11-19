Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088237;
	b=gAdRkNr5vTARe2VkmjAoccDo10kkaw9j00cmb0pmZUxxQruqPYTaKHcyDAEkRQBswe/i
	 d01FSb/NYpogjpsuWGt3lcweWnRzSffLpCfasOyHzsRvkMpfRgf+vKA/ym8BH4Fuapsf9
	 LlseHkHmgOpzA7O23b/FLsk6TYU7qcqWgZi+a55NFP4WGNNqkPST8nTsNzVDcp0dr13kj
	 h0y11zMafwciDgpQYtyNJ+Aq0vV256W1kifEBfGX1GxMgSQgpMQNS00Gs1aQZH9ez9Lvw
	 fp7X7kSBCkuRSHfEVKRhAHcdRvv051BdATuKtm2Tcf2BvwTDPLiTQkAa4nP9vDPrzQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
	b=auYgUSz/WqLIzxu43lf+/SUMgi2cKcXHNxrG0GZgiQzbfIAhKbx7gQCItjIiJ3/CGCi2
	 nO9Qz30AUnmULQTztZePzHl1UbqmojvP2aKhr0JjgvQhmNdC4NniUu/hs7xfZt0JbUfly
	 SzvPMPMSE+1JE6Ll4pkBqPLe3+6uBxHxC3lWcspp2iyIcwhU1XkA7hcbaP3hMxaDM66Mi
	 UhgITIP4d6E9jB6WwCKhc9Oq0EZIIKNLwjWRwC9V895q3LrZ9ndda6F7d/X57zJSc/l2H
	 SJ7EFN4kIRifKLh+fA0r5xHY0ACa7mqK74K7E/O0PuZGCzt825y/dGNMgi1daq6NinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6A606A326
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAvj3Q4173521
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=; b=Grtmjwtd2WrqGcHr
	Cg84k1x+8W6B2qV1BAxheZJdkVwmTYlw2TjCmToqVc5elmng8tDROjGiz+Gc9Q1X
	Yy2+imaF1q323teMmCXEqkVV9LPsgJhHToJIgPDRH7sMFyHcuBtkX58CZw85zhub
	b9dQ9nL/StXJ5kEIcZwfgzBPtkup1GvFW+IgC0d32pQwsOPvjD+EVQuODVMUMumQ
	qLdCzwD2VQRAXciHy1JC4e70lUCPoIsHArpgWykjdBBlrn7T+ZQAVrhCq8iKXMEr
	asHfAQGanxarmAAg6W9XzLKnNbpxh4MMCS200wZ0iYNjTVNqHaoD13SX22caAwYa
	TiSvsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2s1xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1688478a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088235; x=1795693035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=gi6fAnnf+G51wYczPOqqwI+BycEfpKwczHXT/sBFBaavybMPy6hS+V5x3AXYYegkRA
         KtZEXj0DDiRN+F+8gL6e9HrIywqWuOUJwgOXGIeXTf13ssyQKo0i/2NC1xk4QsFNkZbB
         Y4ws8vkWb+b2aBicFGhUZfiQBLOKRR7cS3No63wwR/uFprcXcqzjScNPeygxObgPH4tx
         CC+xN2abq1baeIEg+BNQfMnKaOFHD4KlJo10cTUAhh7zGDNkZALbBMCNceYHzXSJLvpo
         IvtW+hCofUJwkza88DIE936VwYBCXo2M4juJQy+6BGU9ea0qKi/hxrJOFKKlUEmkQkG+
         kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088235; x=1795693035;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=QXz/wKl71W7giRJ35PsYmvT7uMKuiXDywCGzHQqabpFQJLOlF96bu5h7suybE4KNXF
         gR0Bly+wMsptRy3qw5EqQm0aMCCkSq5TG4jpsUZZOqk84b2KeysPZGWHStfMAdm/J9PA
         kjEh1ZTJ2xtprdDqqNlRF0Qpw1pgJYkzBsiP0oDFxzvsbIvpFPaOsbDgGQJAP5BQxKz/
         PUmWEIfnooZQ4fDO0QcSdZoakE4uBQ63e1jFOEPSrs53eRpMVQqvsVv7SMipXemDSac0
         BMSbar87LXfySt6/8eTQCexS7JgwaFDoE6XnlznHKwduSH9NrZcwrewHqKjSQ/eSzpfF
         whyw==
X-Forwarded-Encrypted: i=1; AL+hErGHWVCFi+7epETiVW4PGDYzNHibzL8NAPdyLRD/dydt1W3VuSO7uu5f4fo8sSyvrTWOJ4uyZ98tkUGj+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qczWM2wjlP62bvuT1oS7z/yk7sd1Hrn38wEYMpM9s+b5OBKom
	GPzj8+dzJh5mSq01lLoBE+DnuAiK6Y8fG/1dKMC8oKvKEAURODaHyNzEDqUBi4E7ykdN6DO0UfB
	xK/QcHL4G3Pxs1KjedHb1ttagunqlQM+noDcLCXk/uGbat9fYUJhkFgrKCtWT4twujw==
X-Gm-Gg: AYBFou2XZShnrnfp2l6qIkLmRCR12uvuxO1DJvji45obNLXPMvULpcxXcJrBXiyz0yJ
	8Jr4yH5xODrJLHtLQnWCgrUeWZr+vVaPrumzhJFP3kfKGfD5HHJFYaH7vBFbEx7GTNJ72XG+3zz
	qSqcZ/edH6obAvHJI3I6S52xpXeMvvoJolmDjn7NW6EbGz0FTnHsHMyuzMEku35crEmJG7GNFDZ
	7YFdmf7EpQzfFW8n1ageuXhMFq3fsnMj9RgObTvMDMY1bFK4Xch4RIq4E4SKzBeDD0gPcdlivi2
	w0CMUUUICTFzI3QkJG1ugovwqmnfFTDTx9wfiuKI3vOBn2NoSBAfD/78M84/0/aA0b6UciXE7QL
	clniJ/GM01qzd3jNeMafzphQVxEBemhC06dvmMMpWLGfqoYPJZQeJM1hmZKByNoi3AE4vE7FMe4
	zgbg==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801560637.47.1795088235166;
        Thu, 19 Nov 2026 03:37:15 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801537637.47.1795088234727;
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534631b8sm1663844a12.7.2026.11.19.03.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Message-ID: <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:07:08 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nUam9UVew1uDko61zjm-qOh28jHV0g1u
X-Proofpoint-ORIG-GUID: nUam9UVew1uDko61zjm-qOh28jHV0g1u
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afedf6c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=RAPgPVZv-YkfXzKxjk0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXyfmA+NMKHS5F
 40EcOyJryk6fNI1hnoVc088nG+VAkPG16k+GlMoPmYka6Ev424W19DM0ZUAo3n2eNZNTZVOdwUq
 6sa46WrP8EdWWkyFMlkZHF6N9wiAS9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXzb//aN1plfpM
 he2BSvcx2ylulDDeaa3Ts/MGfLVttl/wrUhBFrWX4kf+2oSBNR6AeH+xh/Arn7Q4XVopwLlLE83
 F02yTDlYEvakZA8/QJ+hVrH7fkFpFeUGJSHyEnhEWeUYO+R+1HJMmZ3EXfAktAKtdSZaaLxPl6o
 m9ILZW4kJ1nKdmqEWQ1k0Vr42jPzPAACVSQzXx3UKUBVPs9KhiZ1yqH3RNzWjAZBFe8qVWU6F3S
 IFeDzI9fayV3c6HOT6KBJ0gEmntvUfCEeEkfSUJzoUry0N+psa4usXg60GinnATRcHnPqbtLfza
 6gSwYV4Sug6QzC9rnrdP6AG8vgcDk+ZAy9lQ11/TTB+xee45qhCbeNyF0IeV/hJMpnZ9O1YC6VP
 zGdEr4yCoxWBmBW/xTVeBhR/hFem7sFXD+5zYVLOrujurfmwSfTjH4iuv4J4lDFrALBs2GE+eGU
 VzwvXsA8Jhu6xeMlJTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046



On 16-11-2026 18:02, Nihal Kumar Gupta wrote:
> On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>>> It was not used in-tree yet. 
>> That's different question. You added ABI and that ABI could have been
>> used. Was the ABI ever correct in the first place?
> The documented ABI was not correct: port@3 came from the old X1E80100
> resource-table mapping, not from the Glymur CAMSS port layout.

Hi Krzysztof ,

How would you prefer this ABI issue to be handled, or should I
send the next version incorporating Loic's comments?

-- 
Regards,
Nihal Kumar Gupta

