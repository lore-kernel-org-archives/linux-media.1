Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683775;
	b=h0PC+QXB7dDWPuSttLA2r75bZJb+yBmTPeg7cle7LRCwcAy+uh3A3TnIeSuTnFBaCL8M
	 YXrAj2dGAweDNeNhyzyanDSVmbr6e2SBElAKUwWs9r2Q0y7c+Kps0ka3iGUZXo9OzcnuZ
	 h6roZy3HTm2CWpiGeUbPwFfXfbFyhvH4M8SNOFrF9TUttTaOq+y6y9RsSxOxGSkLqH7yP
	 rt2hlM5Jf2KUiL2qlN8XNpw7rDz5fgIt4khuHRQqst76VyXkeBWMSNpkDsVMiKqPQ1Jbt
	 g1iIg3RvN2Fc8x7HnOED9hN1Rdo1NZZa7Aw2yW5bWS7cQWT3vBmkQ9wIJiUdS1gPZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
	b=gYmOTA4xo9e0h/bcaCMjo5b4WrZO+t2AfXz1ZSp9KXKVrbmTa/+VUWcwuCNcyN2S40Ys
	 pvKMi0vq0zqXnMUU4PlqG99ILeGLybt8CtByK1+a+AqNO8+2Qhv9nGAMHAAgjJ61I0PNM
	 xyRCclyQe5EGpsojTNRv39GdUc3f53COvgNCJYk380Yte5SlrVhFZxT9eHlPuDL16Lscc
	 lsljZMTUuLuGmmnvQ9DjPu3crqnCdcn/LoKncYMqnEdrdowkiyboLTZbJtdxkvcjhFNao
	 jR3jYhQDlAA+Kbw8+VA+3Nvh+KUloUjbW9T2RFl3idMbq/K5rt7gMFkP2o/0E+DjT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9GBgtRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bU69q46f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE93606A32E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 05:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE93606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9GBgtRQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bU69q46f
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33hrY51141745
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 05:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=; b=Q9GBgtRQxImJvKOY
	7Ikqd4ulqysMzq68hoqVh11FXvbQDDuyCDnJhAZ2zfD2nuYN2KY6K6pliIrhh4PX
	DKOArf8UsxsbNLt/6tpSl5R2q8T5oyx92eRidHrtxNrtf8ahgd867C2exppBMnDH
	iYfXrgI2xU4FXvnEa1tTw8UpF0wfmt9FprF7ggY+PwDBJULp+1gMnKD4V1a5qzSo
	oFk4JMSdS+xNthtrUmcfhG92Q/UW/EJhW1WNHUBflv07tTd19aGwbqvHWDIC0P+2
	bctHeDnl0BhYgvGQJjmF0zIHz+oaHGk9PZ9AK8FU6F1hQPfmS370Eick7uy6LN7a
	RZcB0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycrbj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:29:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93f266d20so59582865ad.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683769; x=1794288569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
        b=bU69q46f8fRtC3RVqsjaS351YsmeEbDx+xAlBg4trIRUyMFOGvfdFzFOD18ercfo6O
         i3+TTXypCp2P8AXm6loII9wgXgh0Y5Vb7kFN0xU6FEhE9EXmO+iSev/NhRa2EthmKWUV
         mJC/23eupq9SfKEiQGB+ZG6AdJHaYZxh9f6KfCnJnJze8WApcjb1RMdV9PQqdYWam8i9
         HrCVSY0k6vvsq05SwN+YMKIxRnMav1GVLR85Xjz/BXwH8V4Gg/E9274QevzSHA3ZsSgf
         mQmyYsmCmtzWlunpy0ngsuHV2g2YQuVMPLvdKgWTSaHVp+T863El2Iici1Zok/If/8uF
         t6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683769; x=1794288569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
        b=DsGvzkWdV2tlWL40THUHoxsDUS8hy0X4FR9d/28fZFW5bBPm3KG/57E2hDbnxxIkql
         3SmbeFmm2Og6scA8W+8L9QMY1yjjH3hDUbtPrRlVEF8myuI9GTKZI9RtbuYkx3/f+6Fb
         PIU7e5RxZAkDq9rntupO3QDjgufDx4Pv0cuvlywQJwiv0rey9OFUeig9FYKHigdYc56u
         g46w+2/NObJVvdCNuK0CxkM+8e72K6WmNCmpy3x75VsqOE4oC7v9ZHE0py1pcHE0VDPl
         1nVUFhldjvqjKHrPAjfEglgzQlkZn28MV7pNNzuxwfEDipp1gjt2btJ4XDEi6PwBPOmp
         5Ntw==
X-Forwarded-Encrypted: i=1; AKwUvBzcb1Q5mmgLtt/409ZGHrHLAHJjJLRlNl7bQmuzDkGqXjspRFXNb68JxLnhOiWsWBYfqJ0yFtN2XVspZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+i1qi4CWQsAqevE/YHwxFgS0fUHWV1JRxOkvzzTgRuUar2/Kuw
	eHLV7QeXfE/tV2PvH0AbJb35PYKSZiE1C/UY1hQNme+IdhtTQMSfpKDCaYGR1DUTd4MhDxdbRmA
	jQch+a+DLnvd4HL6onzUcOxbdG6w6ERX/hm3bTlsuQlvaGwef8nVoA058IMNnHpDT3Q==
X-Gm-Gg: AYBFou00Yl5HmKHq4puIUPCCFMZUbojAkKxwtjFdmGs8JR224Bu/W2trQAMJ73F+rlH
	gG3OkiLtsQpRFolheNICUQBfOraXNf3rKw8c6mE2RXtTqS4VLcLM3SOzbD7t/nUwmzPL2caObJF
	UpmtQz1lnht9yPu+A+oJc+yKfRtrlihE4VW3uTyK/SckWrdhL+J3nC9k8eP9YrbS4cu2sZQ8+UD
	mvsGVDmR4gtYK+QIxpKYl7laTOfbtZxjRVjDywbaifgz80p9Tw3Lnf5whFo4F6Qig637reblU7n
	dn6SNQLQ5wyHrGuEoIvKhcXpjhJ22xdYNk7rPeO/E6tQX0E4ANWTv4GWGrS8EAqdEvIkt4eys26
	Nm2/EzCF2CNK4Z8B2vaLBeEMZdtFhFMyG9EjfkzGrBABWovDNfJh7KNu47uWC97FRXm4rg4BKIh
	jBJ1HfWciBmeaLDhdA5+NFv7Rjy/yHyJ1C
X-Received: by 2002:a17:902:f68f:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb364c45dbmr110155165ad.30.1793683768725;
        Mon, 02 Nov 2026 21:29:28 -0800 (PST)
X-Received: by 2002:a17:902:f68f:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb364c45dbmr110154855ad.30.1793683768154;
        Mon, 02 Nov 2026 21:29:28 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f56bsm35371005ad.16.2026.11.02.21.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:29:27 -0800 (PST)
Message-ID: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 13:29:21 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae97139 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e403w2VLNo3D9SQJzk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Qm_kyZoRr63b_At4TMBCO3l4n0q3jxCs
X-Proofpoint-GUID: Qm_kyZoRr63b_At4TMBCO3l4n0q3jxCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX575dVBdcsq3F
 E22F2Zuut2XBFoAcTrSZTLVN2ht8iPiEZVTX6zxggofo8IEsVvUXl/5VOYyEoyhB74hByRqZdqX
 BsyrOvOv/XVHwkFTnLwh7Uu70cXmXIZXrBr+Aug9Q5Y9w8GtKosj3E5PB4El3mlrDJ+LIPa10UA
 kpUXW9pDScxt41IHLQtk3BJD4xpLfapXX10ycEmf03SO6ypcVXvFG1EUbPukUAoqQZCUwIwisNR
 gaz147uw9p2cWan46IvmkW2qrShr2tatBvdFkAqxuOGlhrIKXohfnTH9xpAq45pvZ6hz63/E47F
 aNOuhq5W7W+dPu/+AxN9THcNZwRaTUaSv70H4cB5L/mGvMGYSMWmpOFRUK/cEpS0e9REHO8ISm1
 xXnJloq6YYEIZoR8M1Pg+9GAg4l/w7Dko9Jtt1bS/OGtTfKoRq+SGjGKO43wr02um4VG7zmFSta
 8199kURseb6xA+6cygA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXwuTuzWbhnT5o
 J3f/16CDfxJ+MrLtvFxLruA5yEr1QeFxmdNZqvo699OWh/wtUDnk0K9rF/eZonJ43wKvyGj/FfO
 Ly157vwhwNtpU0xvI4BTBs+cnBeg3ZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030021

On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 15:25, Hangxiang Ma wrote:
>>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>>> +    /* CSID0 */
>>>> +    {
>>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>>> +        .clock_rate = { { 480000000 },
>>>> +                { 480000000 } },
>>>> +        .reg = { "csid0" },
>>>> +        .interrupt = { "csid0" },
>>>> +        .csid = {
>>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>>> +            .hw_ops = &csid_ops_1190,
>>>> +            .formats = &csid_formats_gen2
>>>> +        }
>>>
>>> This looks strange, why is there only one clock rate ?
>>>
>>> ---
>>> bod
>> Hi Bryan, the current CAMSS CSID code always selects the first 
>> frequency listed for each clock in the CAMSS resource table.
>>
>> In camss-csid.c:
>>
>> [...]
>> } else if (clock->nfreqs) {
>>          clk_set_rate(clock->clk, clock->freq[0]);
>> }
>> [...]
>>
>> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
>> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
>> 200MHz and 300 MHz is not sufficient for the sensor's output pixel 
>> rate, so we need to use the highest rate, 480 MHz, to meet the 
>> bandwidth requirement. Thanks a lot.
>>
>> ---
>> Best Regards,
>> Hangxiang
> 
> We have a series from Antans to address this though.
> 
> We should list the clocks the SoC supports not constrain that list for 
> one specific sensor on a test-case.
> 
> ---
> bod

Good to know that Antans has a series addressing this. I agree that we 
should list all the clock rates supported by the SoC rather than 
constraining them for a specific sensor.

One additional concern: if the clock selection logic still always picks 
freq[0], listing a lower rate first could leave CAMSS unable to work 
properly with sensors that need higher bandwidth.

Could you please share the link to the series? I'll rebase the next 
revision on top of it.

---
Best Regards,
Hangxiang
