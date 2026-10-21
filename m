Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591344;
	b=uwCz+VZ2fbfGHCoUksuvPaE9d6l7dqmtokX5Iw1vYf2XpZU8ZyjpgBBbD+6z4xyyfjsl
	 4ayQKDcEByt+p2tJ9+EYrKPWCkkGTvHmmZra4DBl7t7LJoIEEhUlIEhYEdCW5666Vz4Ib
	 PUDiXmJa5PK1aFVWVsAuX9hRlaZQQ8n6u+TEnF//QiKJWsACDOqsIv5iXnqKd0pEuevGj
	 Jw1WqZ1laF60+dW8XWP41QzkbM5gZTLqynSvix58wbvNN9apdAdcu0StYgU/ti8abDnPU
	 p9RkL2cXc3uwbuYW6CzIQ+s387szAgitsCQZnG69V6VYHhQ840D2Q8ybkozlA3RO9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
	b=yhQsvePDzsbVhwN78Wp2E0KC1SVxELG/QH7np0EGI/m21u/ilCzn8xrG5SmoT870pyf4
	 pJkehQGy1H1qu2qeK9lwADX+qRJ2BsYr4230EkR/B4PPLLlKD6ggd7tleUJtiTJFxNyxj
	 h9v0vz+HFicecDzby+jwlOxs5lA7H6hcyNklw+mGoXuSlFsGfb7GJuQB/TvHVtjE2V/89
	 nbn2c9salRsVhgsqR0vp1kB2tTNZQz5e8irZK+Gzd2h9fCn4rBZNyIZN5qYdBnG6J8PND
	 ow00wcdOdxYwcmSRwJ9JBzytAvontA9NfetAcq6YrsrGV4Tx+VBP4usxlJIvNsTttiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C489606A324
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C489606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDwiTl1353394
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=; b=di2bf290CClcfrhc
	jKzh/qb1Tyb2Dez0KXF5lHo78AqpupmhKBvOqSewBsyOdqxvu8biDiIOPyNpDgNn
	d2H+AVDxpSzD6SSAi48DYV6INTM+aWRzxMRvYt7zzVaJR0YrSzKd0NqQb2s1Koxw
	khCwHPAmM+fkf3iov2OpGJ1FNwprBNQDSN5/a7u4BlRwjlXAxBBzWu0fN2Z8bRWD
	eoWHsFeawCoo70HcizOlBf/b2NwqNtygHmlwUS0W5ZZ86SFNhcWOzi15TcM8z7iL
	Fwe6fRKCa50MEhq1XertPSk1M3PByLk2NwK0C1sjzRa/I4/dAS9HCOySsLp9qVqY
	lRPUHQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajm7pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:02:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-517b58de0eeso21259b6e.3
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591341; x=1793196141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=YnYgPettYe3RxdQG9r4/qhTs2eKwPOLdC6Zxq/RveeV2Zov6UiKlbawF9muxkq1E5a
         OvyPyzANNyv1v+NYqWm0LotFp7BYa8VkXIIV6O4Ciud5WueCaWgcn/TZkCWWpE//ek5q
         /9tYIutHlofKlUEUA/mvIkNXKHxAYc834V0fuu9jLcwgL4Zj8KozA8fomjlLha1ciKYl
         KSPBCrWYnx6kDUPVwdSZax0uhdX4rKoWmoe03D2OMvBYO50VQt0MaBO1KrUGfH9izYmV
         qF8iQ9JhP9qfeIxF7codRTaesY0y6JnattSV5/1OctaueqiS3zH7R0J4/VD28fZ5BmVt
         uICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591341; x=1793196141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=Pvc4GwE7KSzaTCkaHMFvHvmKUsVSytpxubV6iuygLsAFTcw/qsvCQ8grwOS5nMhh8Q
         UhfkwlqmzEvsRpme9Jgua5IP7Pht8H2d1ONobeOaq9ap1h97wzHp/MY1pceHRDQ4GuE0
         10xW9a89UgqfthN0bQ3p+F1hgXWhAJ/M4LgFWEQzGMM3j6U/WWM5UUbgqCjQJoAGRpSH
         QorFRn+2LWomaO43a8s/gSWCs5Wnp0RMKRkXP1gFEzQA2wwuvQQTTuHeNqoiNa44xwGi
         6BpJ9iXt6l1Ml1wh8dDJO2axZ1RC2HJlNwJp0pZi5EX7gJxoNFNVgoSlYjKiWT85TNnX
         LZBw==
X-Forwarded-Encrypted: i=1; AKwUvBxHxazVLJEoIJ2y4a7XIxEyYxxmiJokpiRF3egJWb3siZBIGj0wbSRRMJs58eqpoZ/ERob9/WlF40l3OQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKtQsRs1irHQ9hjVbCkh+s5dfuwPeZjBx7hePsXrjydu5R4I7Yp
	NppVImlB9QZgCRcK80nU+c8SS2/CidTaKfIKA871r6HLvto+9SIY1RiwsP/NC3cfDGL3xsiToUw
	QI2dQP566UVnts7ohsUUNpW3KUZZASKuc45xulNCpdXOcbOw9J0vayEjmP5Oz2/fx+A==
X-Gm-Gg: AYBFou2HYQ6gH1unvoawoNTDeWZ9wowLdXJXK26HUkphjxs52yk4AGQqCErKYYQPP7x
	WIQGb6oWhkLmLBCvv01yg6oIW2fACqAvoyKigtN02MbvdaijPLQ6afe0MlKzHJ9M5ozeZl+1N5i
	ENgVvBifxJZNKuwV4qfwxGmBhJJw0+b3IKKObUkjC0fWLyFSOeeJfR/9NFSGN3rK07zm3Gm8P0v
	aZcd08WagFhkd1RB8qNZW9YBcCMrMloV5vObkFHKyoQGvS6s/IrnsyU4RDkcRA5OFZbeVohDpUZ
	2dBXklwTdw+9/Z6FpeaGhl46PI6FkaGUXz4zCbbt4Ms/uJkOXIgvCzVA+unpo8g7Uh+mSyTxZiJ
	frrfj2o9MpEhg4+Ka1xu/ZQ==
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213767b6e.6.1792591340816;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213659b6e.6.1792591340150;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm856108a12.35.2026.10.21.07.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:02:18 -0700 (PDT)
Message-ID: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX6a5dVe+6LcJX
 Qb/gCPwj90saFW0au4sxaWAOj1BCfBfpQBvof3wZqENbxrfN4HKage3vuJC3E+cDaUx83+GNeqW
 ZkNYmcbRyhEAm3wJuwh45RfcTeli8HLy4QPNCAZMAmcgZhTlKAjvscTVMWoozfVtiMeILIciy+r
 ePixGXkK01kUOKoRFOXfF+t1Qx5IMc87t5KEUJz71jdY4Wsx1OaMPn42c7JNIJVTqzI32seomhG
 TKuJ8fkj7mqElxuLoYvuazfgowM0Jgqz7Cqq0v7IoMMeL2HlfribSY7HqaEWkFHNmHy7pFsXjMO
 qKCuGiC9U1RM3ZZoyBB6xasINNMuZX9J4uyBbbQvZq/XmU/Zh8q+jWn30sqssvpnzdgbynPGoXK
 fa2SZHu0kTNF+UqU3uG/Uq1A7PSICB7qkB0LIUQBu6iqhD4wZiWnRRhHSuNKEHjgxkI6htJRphl
 l5UMwsI1V5UZY51hidQ==
X-Proofpoint-GUID: OfC611b7B7CqHvOi_EA_ArKcVjF7Dk1U
X-Proofpoint-ORIG-GUID: OfC611b7B7CqHvOi_EA_ArKcVjF7Dk1U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8f0J8hO3KNq/
 4C4ukiI9PPUV3xUANu9FruAWob7dakKS1iBgehtOb4KyewNJ44JA88Z137tPFWtUsHsr1Iw4LYx
 BMKs8biwhpKnwWIYNXLro3e1yDsaBsw=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8c5ee cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0yJHs1RHlB3dt4QKcIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

[...]

> +&camss_csiphy2_in_port {
> +	camss_csiphy2_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy2_out_ep>;
> +	};
> +};

Please define the endpoint in the SoC DTSI like the glymur submission:

https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345

[...]


> +&csiphy2_in_port {
> +	csiphy2_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn5_out_ep>;
> +	};
> +};
> +
> +&csiphy2_out_port {
> +	csiphy2_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy2_inep>;
> +	};
> +};

likewise for these two

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
