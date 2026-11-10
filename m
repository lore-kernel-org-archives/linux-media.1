Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309963;
	b=3lxoli9DCVPITEhdKkBp1bTsI2fsqNz+d43vDxBpOzSQ3O36sH+dcU6MG4ULbCYeNtoW
	 ancVPIHF0VFLkwLtfFlJt5GHKe+BjvY/Qlpsdy9X8GNaEO+6CWGpPpr2KzPHQHmto9Kp+
	 SgX2mqeRJw28cb66yYNFl273D1lvj7YSNquudpJhLjiO2Act7tT40xhKxK2ryKZyarSQr
	 JUYYlrLnjWwKcwCGUWHRFqYNFewAzp3b1x8iSthGJzHgETPkU18JUuLTDaG65GU1k1bn8
	 QJ4Z/r+v7gBB0GWODxI76hVgsDvjfGo7edQVO/ugaTq1oTuXjpSZf58iPef018P/MTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
	b=Q0YvDrSXcYcxeYJbGmt0VkQmXwjKZ//N7fNfofOaD9iaSuvlbt42iVNmm9kxByetVcCx
	 jU6/zypNYDXfRSWo4BoI+kcrzO1F4TZj8QFN4uGsf2qyxdAbHbqbM+auwLWG3S+TiO/co
	 TNLLG3aup+CG7KH5D+HVVISafYgtF2rQXvvldHHbwSKf6wwMH+sDVM/r53X2lyz4yIJ4v
	 uw1PgsJkXMd++zCYyt8V9/7FbsxS7ijwsx68838+k9SKAPaHuDijGwp9ydT8oNGDTC5I9
	 N4S+GwkrEAUy7+vd43Obn+erA15jGWpP9gxF8MSywMJLF2fB5kLzzDJzWk7xUC5jFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C160A261B
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8C160A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92lIBLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMMXIjSC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGfU3839680
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=; b=J92lIBLz7pYKGw8I
	gZYjbGVL16cWaE8Sz+HU0uAiPYgVwztHHmPRL2TKDdY1nIehM3EJ4hYL7xLtUqqV
	/5NscAeXvx4qccy0nmqKQTI4bqhuU25c8v+jW4OxoDjmTBeDbDaEn00DRYOZa4mO
	dZpftPY/ClSCL+wHZ53Dj1NDQxfnc8UiDGar6i2ng+XCorBR9HTh3N9ZofF7T3M1
	tPEAh/nGNmiL0cxsvxJtByDCPF2FpbFpBUGfoXYjCnxdSljFMaYsSrcJDGUdaVcs
	qIxQ50h4OJul+438na8X5PJsMOHEPpQCbix5jxvvSKh2ULmO2biLNVUiGESYw+s3
	g4ZxQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg36x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:26:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so4655586eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 03:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309961; x=1794914761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=hMMXIjSCvArpbAVB2pG3tviVjfF/VMqStvKA+u31AUt8Dhlejv+bfF0LRzAJ3gx93U
         HyOS/mgKmNSQAbGkqlEMPthzkBxg8wFuIVTP+2jyMRKZViv6IW9gmzOTavVXwRmpxorc
         5YYbR6ORP5kkB8MI5E8iWC/cn2qJk+8C8l8cVYEy0DUIbjc8Xr9HykuEpkARKlzRR9qy
         rlNBrB+CgqGQUeRXWUsB2sK/bZRUBW2iSXOpZKF0MAiKf9raLDeDNKCYFYLFFjr2noiy
         dIyBlt2sbDB5VW9vVoGN4ck6kJGmcTlLbJdYSIubW2TsbEvo+tDyD4d8Egg2K0XpFUdE
         OYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309961; x=1794914761;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFIbWd7oUG0ljPJ7AJNbkhIESmFZoRW/9paFOujjb3Q=;
        b=maBrjZcwePeZxMTNMYIXQeypluV+PQ9GohuhvhTQAS+M2zVU993pC+RiTk6DrgXlui
         aRgFh+vwbAYxSnHO2yFuzVL3RSpmWuRmhjCt+6i4wzG76JWxiXuWQKR2bwIvxu5Fm0tu
         0rZUkq8wlmcBrx/PJtFnew8hsxdo7w6Ux3cWDlmLtAFiRjymibrKY2XC8wzUDF+aIjSI
         GS7lMoLHTEg+jSDyQsIrDeUiz0E/hdRrrmigECDeckexUehlKlO6AO72CbU1BWfhCSL9
         DjsCmadYgn7nRdVB/UvLHEVEtUoSgtCimH8KtjSXgv7HNS66jXHzPYkRJUVukBQZ0o4F
         /p+Q==
X-Forwarded-Encrypted: i=1; AL+hErE2plBLbMVQbsvmmR4abxyh0Vg/owe5Fu9Rb4kqwS+gzr+RiN7ymKsNYYvwWGN22crC2BSVn/fmuqV8XQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FCOWPQI8w2IJ7Y7XH7z3bb89V/Jnf2GDzvqNyAQ4KmuTGPIHp
	7BL3zGVzkxi5XYUA2hm4Dzh3Ql2beox4dO2o5ntSpanXVr3N7olKikR6nX/lYr3/SEF4TrEHmY5
	GIbdvYyXrvVckUuSoGXeFSwzIDxkNIIamnAIoo1+TCmQ3O5nNRkTvf2RCuHfgkLkdog==
X-Gm-Gg: AYBFou1j3Adqill/vbz7cJEHi1kOglXvKirJOvnf36pkXXgHwf41ih3aDzF8RpGQ40N
	8Kst3adWCYurBa7L05HRNQYa9EPtFyhct/n/0EPpCx+OxMUjG3WX1e1aQ+iAzqwUKjOUvf0yogU
	x5nlg+L9sSubt4Wq2raj7IyTrsO8w/mxHdsaZRSa7SrXOU3SRiuzGSBHJ+68ixOFCTFSwyADnXR
	zBkodA5btsGqSPVfZ7kZm0I3if//p10VNk8AWP7Ow7Lq/wXgh54AJxBdRy1IYVS/6zdG6/hXOng
	DUA+lMOoxiERzwTrr9q6nWRX/AOYiM2PdJeXMtVosU/zbdxh5sOOBGM+ITW7PN8g1Jt3M+vu5oJ
	smKbZJtbFF8eM14MokyTThI4L0McYa/MHfu2n9wAZT4kcKIEQ1vvhNkrQv0EW5y396efMcVMoqC
	oh
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132154eec.5.1794309960575;
        Tue, 10 Nov 2026 03:26:00 -0800 (PST)
X-Received: by 2002:a05:7301:6194:20b0:36e:d060:8bad with SMTP id 5a478bee46e88-3751c53edd5mr3132114eec.5.1794309959917;
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm6930570eec.7.2026.11.10.03.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:59 -0800 (PST)
Message-ID: <65133a8c-7b10-4429-b870-62799cb50d4d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:51 +0530
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
Subject: Re: [PATCH v4 3/6] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-3-d528c7a797b4@oss.qualcomm.com>
 <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Language: en-US
In-Reply-To: <20261110-mindful-snail-of-business-fa211e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX54F3/4OVY5E7
 qTyN+g2LL8wTOEKN6tUkZSaCvxJoS1VLjUtZq9ibSY6upYRNoV7XrOMxv3fkOOz6ZmNx2btNeSn
 WAdKCs0VIifbmdYHlmkiHQsX3Vc6xnvWjVVyJltCJltG8TK1aLfUjJUrK1M3TdWJMH7IGqbMjIx
 obwq1uxjJKoe0x1aL+suKrEPMtlLY2n/jWwX8pBGzbHCMkEECJY9OM+kOcPUlNTJs4XyySitHyl
 bydGVJJyt1/OiD3sbW4sKXdkORAW02IW73ewU+S4MMf9D/oPe8l6vLKKnNmGuuXzBgyvRWdCKjC
 KjgOFh8mfs94mN0NHus5fSAWPlppcGD8qZ8wQLA3LSYdE9Nbx7XfREKzjoDm78Owf8Qg2MQZDGI
 X5u2lN2C3J6vaRrKga2qjwqtfBpKMdsDIsr3VtlpXTof5+8CKPhON0addBmPrVMYxScQZ52tDLV
 smDOQMjBlku+UlZQwzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX+AV8l3YlgXjb
 6nDlKeSQPFz+vwxuP6WQ6QGOxOCnBbR21giH3kfl4tTyDsAWg9mqoMGV973X2u09+svEzQiP4Cx
 fEeITitL1UfCtP0M10vAhftEn5zGiW0=
X-Proofpoint-GUID: 1mxHlhHWaVRZxspteROjBISwFvSgHdqc
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2ff49 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 1mxHlhHWaVRZxspteROjBISwFvSgHdqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045



On 10-11-2026 14:58, Krzysztof Kozlowski wrote:
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
> Amount of dependencies here makes it not possible to apply and b4 diff.
> I don't even understand why PHY patches are dependencies for media ones,
> but if that's the case, then this must wait.

As mentioned in the cover letter, patches 2 and 4 are for the PHY maintainer,
while patches 3, 5 and 6 are for the media maintainer once reviewed.

The PHY and media parts are otherwise independent and can go through
their respective trees separately.

If this layout makes b4 review harder, I can split the next revision into
separate PHY and media series. Please let me know if you prefer that or 
existing layout.

-- 
Regards,
Nihal Kumar Gupta

