Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319C3242B2
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684630; cv=none; b=qIR9IgxWPZWbTJ0hzkrRNt0UB6pahqOEM9ztDTd/cbE2UBnCfIOYbw9t5hEikMM+pNbHdtBjsikJL1qdTOwphdNaJRhh01KYeYmTVgFj2sMz9954/9UJabAiEZqalci9pnjR9svwhKNr6oKAHaQX0ePxpILt+ixA9jCwhlfSNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684630; c=relaxed/simple;
	bh=9npdYYfmmoEFSOdMRuCF9ofpjtgzf0emYQNLDswd7Xs=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=VL6lOrsaRzQatNFTHa75Izn1gx+9DIOEccXblzvl//Ehfy7FUbFM+9TyFU+r9eH9iBNScOvh5G48q1erzwfdz+ZdV05q1BeRZNL0N/dzXCUijFg2nhvlot1WjsjxybruX7lA3Pk5ZeiIQn+zLoghxSextSJGTuP3W+cdywMbR4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LA2tnapK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqdzqWd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LA2tnapK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqdzqWd3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1ClDj2961973
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=; b=LA2tnapK/pYKtxWP
	x0KoCjHcR720XIxO2Q5RhUsqy09mUEr/sUZuGMr9pQiQRnk/7wedO5cJDv9J4nUS
	UEHhgIaLYpSBIeq9qxQbZDh32pklvVPzDNKeUVaf4KhQQXI73X4L6fpFhsFbfUSZ
	yoiy0b2n9gmxuaG6Rd7pBnVraf7E9nLTsi2S1+pluEZTnePAHD8jFrZEEJifKeKk
	hoJsa2vSQOW8krNh3EjZm1NYawXHVEjuWcS9dFWqWVyjP6tt5ntiFhvc1rrXhFKe
	BhO34vx4ouB6U0W5/ebWZg99vVmNN3FpUQaUx+bYvyrkN6TqedfeULNMlLeEMAw7
	+vpAjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fsnuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 01:43:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so5443628a91.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784684627; x=1785289427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=dqdzqWd3wK1NDFy++lbOj0nFtZLdnLpPlcMMgBz6151Eqgx4JpFRWYzIDIZXQmRGdc
         +rBgP+UiERvEw+GmVf4C+JrDRWJ8l+bDnLji5LVPS6aFiwXxiPp92S8nK1Av+E2fz302
         TRyxSgfJKrCFydti6JvgBjbxNSjSuJwG4ereuptnt7FTjIWq5cHqnDhJQRmhtJPSWYLe
         Ts8mAi2lZMzwin4eTiY9Fs4QhHJt58sODsiy0VekIM1GaMS7q83WeoaeT26Oy3PnUaFx
         lFMDP84QFJuLLXsmRZKAdrfqX0gZA+Tkvhcbo0bDdiZxYjm6tXzv/FNIk32+0yln2Uj+
         JWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784684627; x=1785289427;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0U3b767XcKM1yI5dNom2b5yXzsy1XqusCrGXw6rAhM=;
        b=cUNT5L4gd8jj39gUI6SDOwnQ+AGeMwjC08kPv/zeYwt2itdIjxa0y7+XMFVDA95pgv
         saeNEWs3aMAZkbGtzN4zlkp6fZqaYzShMmu3T5bZaYU2zm+qjU64IQ0KQFxx1N6y604d
         pD3kkJs+bXqMm+jwgTI0BCFPwoOqStY5xezh1oGkULRNxhJWP4ul4pkB/CIRHZaL7hiN
         OSSSx+eQQK0zJPpvgNGRid5Apy3FqL9fbBtfGyFOEfrMhUhvIVVDy+XVu44tZd+5j1Yo
         L9X9OIQqj2KDAmq4AMaKKxW3vUPspGuj1wufAjMlxZYe2fcDVZNogXkhwDftUECLbwig
         RDtA==
X-Forwarded-Encrypted: i=1; AHgh+RpLVWknjEMZLFebTbrC+03qzjawgo1MW/PODfHok78NPKL2nUHu2eU+wlZn4q03Q7zAmDi3RB1Bp+6jXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTWHo0Hh6LV6T4z15nkT82bs15P26Tzx0r+c+IiFagYl+J8sv
	2RPcb4vwvQQY4IJlkW6tql4xL37k6hlbhgkpadnMD8LgjWZUitg5rd1PPSpg6PTmXvBe5D7mmAO
	HcVqZMcbE6BjhmjGldekrwnY6LKJJK1mvzNnndVoYTTcLrKQFOsYaLVzS9HB4qyDwmw==
X-Gm-Gg: AR+sD12Pdv2fewCaeKd0yfjvcK4FlUhyIjfzujEq6FpXnB9wYQC+W5TCiE0Efau3lp7
	JrO7QAQUKR55MgDQmauIU17HSw3Nfc90VKOyD5vIxDRZ1xvb8guhVpyjqUglCuyMESo6LznIGu7
	5BawV0/SX5hi/MyVVmqh2Z9S4Qk5IdPsBdPkU+iiWS7rbtH/6FmfLkIRgM+Ro6FsrLCSxlbWz/C
	uxdCpyMcHlQcpTA/qQ8ImIu3UEYTRFRZRiRAvcCJuUyCLWOP4xEMerRmfTLccQ2ehHNfGgMlRYf
	mudaDll1X1/B1xUwDOAauiK/EFYkJqWbJmGFIIqZKixvfDxeLUjJ43Xtmoq9plzKxtG2QhYUwqi
	yP/dg2k4Qvd9qfxEjuf9XAeii/dE=
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080334a91.21.1784684627375;
        Tue, 21 Jul 2026 18:43:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2151:b0:38e:4e61:c9e with SMTP id 98e67ed59e1d1-38ea3730563mr1080313a91.21.1784684626820;
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea755dcc2sm199136a91.0.2026.07.21.18.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:43:46 -0700 (PDT)
Message-ID: <13de2a87-308e-4cdb-995d-b49fb91293ab@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:42:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for
 Kaanapali
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
 <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
In-Reply-To: <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wjq8IfhvFT0_WjfqhxObftYT4vz1RfHT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfXxZDdatM7bXS+
 be81y8SLCKMrOM3hp0NNrFCgmOs9o1odza/ruUztHGKjMyA0RXn767f1PgQNL9Qmi1ncO7lrl6N
 IU9dGtbs/3fzPhzMTSxp7mK0Z7+06yYO9W+Ba+UcD07E7RuUZS2YsRTIW5KCQmD/AwSyfRRr9MY
 c9Ao/ckAZ0aQ6CCPRBYnztWJqSaH29mh4N8J9/T4crlEpOxxxVG5SLHWu/9fsQFx74IGuH8Tzmc
 Iq+1LKLSy9WGBIYk4rNdKuE/349nruKrnj6UXXwO4ZYvj0ir361ULZ/ia4pMwQHS3MBRh3nKJbs
 Qn0eteGvyGaAA8gvGwWWR02Yw+suCPlSlzrig9Mr99OHV2qdvEizuHJH1M4USXxQSDPBD1ozKGP
 AewkqaHOvRibzDwuVXNRq7NWx+KeY3jCiSKUpT6iVw9uslUDiW1qMfQQciHBprJhVgiToj8FfSY
 RtG3b7Mrf3Rh53sP7+A==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a602054 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=3WjcDeQli2E4eB_Ao0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wjq8IfhvFT0_WjfqhxObftYT4vz1RfHT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxNCBTYWx0ZWRfXweE4fVU1ODAA
 fYryeHAWpmTJ2naI1hiwq7a1G9ZVvhIxKBTOscUeMQbWh9bYWeiX4CyG2MbWIr7PotYz1bNudnF
 o5lNJQGXIh56yNSyv1UL1BGdtbyytjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220014

On 7/22/26 6:41 AM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 21/07/2026 05:50, Hangxiang Ma wrote:
> > +            csiphy0: phy@9523000 {
> > +                compatible = "qcom,kaanapali-csi2-phy";
> 
> The sub-node should be dropped from the examples.
> 
> ---
> bod
> 

Sure, will fix that in next revision after you post v14 PHY driver. Thanks.

Best regards,
Hangxiang
