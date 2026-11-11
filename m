Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386154;
	b=gseA/3wJnUR4P1r+F8ztCRzlO1BkDR7TSIpo7uwsDHqdpehulIj8hIwB3q24tQERuc62
	 ABqUy3MfZkL1E/TFlVzTmDRbT+PbAJFTzccJpAwVG96/sxJbDwOeyGfcAiQnwqvyhHxHZ
	 JMJFE3iYorSDa7Cc8N2MSEt/7rWhbKKVT8MVks+6uMFXf02FgP9Uy/3RBQIAYSbalbJc+
	 tsIYEItm7dh+mafyp6hS1gLYWAbLBfsWAt/q6J1draL8S77Ll8JkL5UWpeSJnqBg3kkMr
	 VsUNCe91KHSa0hNY+0E2ytio/hpkzuke5n3Gp2yDYmWSXv13syj3nGmR/I7YZIQwCAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
	b=0I3Gif1OJy8ltobBaRSnV7e8crfRF6VwOfzQ217D3Z/YVRA+Gv+upWiNhdYPDqcQuocM
	 Y6fNuSR92mBIZFgCOk3253ArPtHEwgcy/we4rX8GnAbuuZMNdnI57Md6LLtn5n8tPa5Qa
	 qDm0rwd5ibeGOm7rk5vPVozfkQT5NblgvQPGHyz2DEfaSuNOOzO/NRPQkiP+ctoN7ErjJ
	 fUDAy7hsB4/MwV9tP03l6ci2ZivWv8jT3FzFwvVoUOst1oxAxyzT6M0S4Bsz+XCULqEIo
	 +Lylik4KxqLYTjIrX1TkG3rboXq5QpoH2uaLwOeaf8LcvwcnMIpHnHBtVKYDooLL9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E444606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E444606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yptddehu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHNMP91
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Ko8A3959384
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=; b=Yptddehu+01hnYqt
	+7LCcjvPhkQb4W7x2CNWLKvcWykCpCP8/a7RKhS7aaCTE6xUA/WON5THudMuuZHg
	rtZ4uJvXK/d37KEcK83bvyPbwSgUIUUFwyZUxRT8m15LhUrEUsOMuRCdl0CSPPML
	VWxej5404/r2tbH8hLw0Oj08yFSU/RcZ5T5HmRjmWQzW908IocRrCj2qP9/F7IkK
	CZRWN7czKmL1lH5S6d8f6F+mY3rXzjX5ITO0onSFKt/1Cpoaw2dnIOgruRw6V0tN
	fa6QNBgDj8WVfXX5PLgcBiGATsdm6ZOHxRFq+UFR/fAR0LYgJsOlMgrrHoNX7Ein
	+5tMkQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32ped-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:35:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5033524eec.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386153; x=1794990953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=NeHNMP91UZxngsSaU1f2nN/RajwhvMOo05q4IXRIBn7uzIbWpcPW9VNaLdijUVAIw7
         Fmj0abDtAnQZtLjtSoQvCp68MYn/TqcoWlV/FF3ojKmFjIwWdu7wEmxjv9qhCy0TOPAT
         YtIsnHY0hqNR0JO7XyUeKf+GbnwOYn4aOUedWso73z/t7RwBtXYmPht9CgvFxRJgVO2L
         sPOao33nblneWtAJ6WX2zU6GbM1RAilyuJZpdf8oK1B77f9FoAKl8hGzQKguB/3ahE1P
         4pvaOLZQz8kyVBCQWUuEKWtFWOtllih+fTj+/aI4ctHUIxYb6Av/FET3Zn5us/PdjV36
         QQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386153; x=1794990953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQqe2AyHT0YtNm9ybUXW8UaggXCo/B0M8+3MYB5QA40=;
        b=JCNAefULllep9Om1Pm+D4ucHO6EbnPNci6yGlQihJJRfJQZUoMiGRKrKt7orBgMRjK
         GPZSmD2iRQGMq1QdUIw7/7gNUiCSDW2mNMY8jwDyWh1G7Sn6vUUXTSjuQ4JhsBptuLTr
         N101GsdJssu1XxrskOsJF4Zu7InYDjdSk0hyQqdKAymWyMMlQ+JF9zGzX9LwFrUqAl/e
         jRokLwBTYdTcM7TOQH9+Di8etHw5wka8d2SU8V9ZZgZSMQ5TvY+1tXiltPkyKNgveWoL
         WkV93YOC2MYM4EvAIiUFXM/Qi+n7Q2ZZgjFN+BASjI8J4I8FJQicJGuJCsYuVjRCum1W
         3Htg==
X-Forwarded-Encrypted: i=1; AL+hErEogSC5cWlHjWoLww5INXCb/hW/QSv9I/eyLZOjfyKp2EM4zasea6lueVKOCH/690vb80Jsqrjm7lr67A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lEd3cTBzsvMFQevrumEu+6+YnzocqKFuux5+5pt3QYV+Svc25
	9lA+DrdBytHqwEFuz4mKvKFwoX5T8CLrZvOiXpQ5J1sGrSX+punTqaQpi9YP8PTBKULewwaaevY
	kuCn07PNaS4WORTrw/o8nvYJzyDjqgJksXNgaTcw/E3HuklDAzwpbK20WdT8jrl818A==
X-Gm-Gg: AYBFou37TGn+ZDav21Z7e9jU4yxfOgcHHff83A5NmWabZSlrAQddLTP0iQSuq7GtLb4
	4D4qHI4rih0YINTjPUUFYs4c27NQ2ZKAmLZXC+KaVJwBYPyOIhWyYMveWPIZIfR0F/aRNm9nyv5
	SGg1FwuLxajf0HiFeT7SjOJvUK5biVarI5IcD+FgOz3RDZmAN64G1utHUwAGeaGNK3efBvKgoz2
	3kCcedLa8KH2Et6acgpP0Rz43bRm/mCq1kOUrLo/iHsAZkXA96YDSNCUy/NmlwW9dFGhUXKqV9w
	LLcPY1Znf9rkqQHRxk2s+g1k6FxYfbrEk4xVBFQEA2FTmX+FN++qYMTY/zniku9U/DdzAo0EVCP
	IxYHfZMkbossQDjSaB3vw7htM3FEaxfiyojWawJ9sZBIl7g+Vkv5EcT/DOCzS18s2xPkRN954lg
	6w3mo=
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436956eec.23.1794386152962;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr2436935eec.23.1794386152463;
        Wed, 11 Nov 2026 00:35:52 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm25690687eec.18.2026.11.11.00.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:51 -0800 (PST)
Message-ID: <baf7c1fc-5eb6-4b39-a396-3df0d367e3fc@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:05:41 +0530
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
Subject: Re: [PATCH v4 04/25] accel/qda: Assign a context bank to each session
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-4-88f2f24a5f0b@qti.qualcomm.com>
 <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e155f52a-cb04-4334-bc7c-54385973c87d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af428e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=AF3zZIX-EdkCpG9-7AIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX6rTVsOaQZndI
 reWNJeOabqKSCJvbRuyRTCJpTdIv0NVHJkAK772bYzaMjYWAs3lm9XD58gEQcuijmcLu07RW2yt
 VR7LvvsOzEG/EekXKXc2TKa+XTPfZtM8231NtJ8bYNA+1HjJjHuwc1mIf17YinDMVLcvU0KJ5tF
 m4LpVJ/+nAZtTeYy8T8W9gCvx1KKTqB4DaQRF/TItm600lpGzTZpp+6CfONMhoVrGtMztUPx4wl
 7L3ALtJJvzPDAX4DUBpj6y1ToOGM0KLxje8lknq+C/A0gEwGWNiBNfNRVWPC+5Qo+HUMWSZ4V4o
 kvgZgUMnsVXQyrgykK9NQFZj7Me1iQEHFw9//Pn7KKuJgofYE1rnF1B6AF9ft86txhxESpAIHcl
 9HuZbrCOdL0AeWRAa3JA3OUm390eI0ibqvjtVrmj9BBWR9W3Y2rI6LP7AjEbpQuu+tcNTxvUiR3
 9jqMYVDUwHTh7sWXhqg==
X-Proofpoint-GUID: _iURd1eNQnsZyrYboglhOT-HNcZbg4T0
X-Proofpoint-ORIG-GUID: _iURd1eNQnsZyrYboglhOT-HNcZbg4T0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX6YmGSRLYD5o6
 HbWD4xRIG+Te0aJpHt9n4C4yxXRVj04i6ny+c4c6DiBAr8/5sTEQOqLF/5RT6qw+PabhFn5Zark
 t9VdRP+eorAPFb9qhM+nIP5HyqqUFqc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:15, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +static int qda_count_cb_nodes(struct device_node *parent_node)
>> +{
>> +	int count = 0;
>> +
>> +	for_each_available_child_of_node_scoped(parent_node, child)
> 
> I don't see a need for scoped loop.
will switch to for_each_available_child_of_node()

> 
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
>> +			count++;
>> +
>> +	return count;
>>  }
> 
> 
> 
> Best regards,
> Krzysztof

