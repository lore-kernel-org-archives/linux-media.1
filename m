Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B13A1684
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 06:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785739111; cv=none; b=O8XmaL8XiSBvp4SC5GrK9tcV40XCMbfeQTnh2NDzWfwyNOziGFFRUK72QEMIhxJCRYkmEPiKlf6DH2g+UeFaKt/LZy06eBQbb335mmilly+z6JhcCu9M1MUDO726nGq2R19+J438Cil8/SXRnez65CeTOZJHZ7w8ZqVjj+IpEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785739111; c=relaxed/simple;
	bh=vLpX4ZuPzLEP67c+cuTJnZelof862na1s4JOb2xUtbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hU4wzLqkGEgh/Ah1TaOmuQjCj56a3AGPtS8UfpMah5uIjIeHf/luOtj6SvIV0PQvQoHSCYSqLXu0jD3STa09+42z4PhcbKYIQcXInMeaFZ4978dTIwkRdYZrHMREU9dUTqSqN4vhsU2S582x1Y7My5BVsDZWVKbnErf9XPAH7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvyZziJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9fkJ/x7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvyZziJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9fkJ/x7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bgPq3957457
	for <linux-media@vger.kernel.org>; Mon, 3 Aug 2026 06:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=; b=bvyZziJGJa1fnsDR
	Udsh/FxIwL07LTkBqGzvFBdMCltRBIululm74y68vew/Alm8cxP+UMZrHd/Sy0oZ
	nLGsGcdc0XnzElu7WMQIhX8jBPHOq2Itjvsskkhob3AQ/lPIwmkbGtt/fmdx7OPT
	l7wLqt/jxu+FWbL195B0JyvHJVUrC3GkEmD195D/AgJZtx/6jSQoh0bNoysDrLUA
	C08oFXnrMPhY2KqEucjyuVgRLbPLzkOsFdgDUFZfFosVUnCnxflOL/rok6ypkI/z
	Qm698Eruzn8WWpOSuZquuGUGaWiz5ptZN2Svh0AqIeiJTW/4V97wNy6F/hAffL3v
	qHK+7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvng041-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 06:38:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so28588081cf.0
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 23:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785739108; x=1786343908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=;
        b=j9fkJ/x7pYeFKxew+UpLFzKtBDbigtHmUGam8WHrwAkIU4n3syWzN5FvmtPnBB3noa
         CImDUMPfOcpHelZT7IlH62VEpqNCWysdsXCXFJyh0tsWtr6RfzKaZrk1xPuxwj0Qc0nv
         IztIYqWnEDCAp3BRJAfQD3BifOmWtSs1/G0aGiZDJhsAUq8DbrqkFZmv0VJZazh5RzgU
         KR99uO+QXgnTTkbgcypXUkT/15bUUUvVLMb7vHgzPiD9/2kgqjxlCuJqR1ypic7/bq9P
         5h7d12uNXvz7IdIOD9yiC8EAyDvBxTwy0QFOMrYOmjjfQbILzFuokOAEPbekL5rgYHkj
         yVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785739108; x=1786343908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAzrxc2hNI6I+qi7h96XH364pbhlv27NAt6ncX0XJyA=;
        b=NymcQZbxclD75OLzXK/9bnOQlI6KFPWIqBecNoKScF0waI3149oi3VlNV0+f9jhU1g
         HaBLlK2I7ctEpoenyHciKr7UTDvkrZmMIzRRx6fTRyCakjx/A6DoNJLLis5lSsfdxEeC
         DyK2poMieLwPWXC9Y+7QzBqtutrh2gaF/YUn8nSjR9meoDCZNj1+bMDO3Ba9C67THrT9
         Yz8Lr90qZM1vWwgQZ0S1tHPknubYLJSt6IV/gXifVvBWwSVSynnu9v7Ig6B0M3QvvLgc
         fWYZ/ec753F9/Po4tV90WcLVEEmyyl7GMKGN775iFM8scaF0tm03S/qcDNpcb3I3nOFE
         knMw==
X-Gm-Message-State: AOJu0Yz5oLcSW5ww1HujmLU2A3qDbRo9iGpN78QNTc5cvcRoVxt1xj/o
	f8WRDx+bplUHcFC7Jo86seNwAOdkUHl0gC/UNVSfgtwmOBBW1IcsKF9UMWdH22sePaxUhQGx1EJ
	up971JYF29iJGKj82v9L4A6JztUgW1d0VQvgk/E9nlAmaHWNbYIH1IRv4PjFZXYYg9A==
X-Gm-Gg: AR+sD13fGcFbEaVaab9DD6movKTwc9sdZG3aHAas159yQDnQbrH8zKZvD1agakriCMq
	szRm/Zk85y3esgF/u0I5KRj2YDuM3QOCqss8keqlHJyFw3HGON1RQyIAAj7wSKErHWZQa0AggKU
	0HgOBXMOjQXa05XxdE73G4YJMqBPOlUSNDtYRukAGYbFuHtyeiOWj3bgDKd4ZY8ynbSNUJxkS7Z
	9N5at+edXWn85i1Fddt3J1ym+Olb6ZH+RCqe+7WIBru8gdBlmQgsM8YKyY5ahFhqyJOCi/kf87Q
	JIcV7Kp7j9yJ5VHBSpkgcI53Ca1BICSlKVO+G0BRe3jeZ1wIj0+qVaflj5maxtydjAJi05Lx5lj
	cx7a7cTF4jU3ssGbXahkx6V65A81mUuvnMJVscrQsAYMYEmTB7CUNn/8cmguowX+xfPKJfk0v
X-Received: by 2002:a05:622a:e0dc:10b0:52b:6543:d8b with SMTP id d75a77b69052e-52b654316b5mr81525921cf.12.1785739107713;
        Sun, 02 Aug 2026 23:38:27 -0700 (PDT)
X-Received: by 2002:a05:622a:e0dc:10b0:52b:6543:d8b with SMTP id d75a77b69052e-52b654316b5mr81525721cf.12.1785739107190;
        Sun, 02 Aug 2026 23:38:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm4652514a12.27.2026.08.02.23.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:38:26 -0700 (PDT)
Message-ID: <fc2eff99-22aa-496a-8ea6-dc9a856819b6@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:38:23 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a703764 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=cLrG_rAEkySFN_cCsHIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VJsYVxxyO5p2B8FW7qGXS_M17Azjq354
X-Proofpoint-ORIG-GUID: VJsYVxxyO5p2B8FW7qGXS_M17Azjq354
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1NiBTYWx0ZWRfXwGK94Cr/DO1P
 yny40lTrdXaSYzumzhiZBBGJ2XAyjrWVZj58dglmG2mNKKxDC1zqo1xMSPo1eKSBR1Dpjy3e2YA
 ICSoTK04wqY4O9N6znfcCVjBgS8vfj+y2YkaJ9WpmA+YUwT/wILwBjiB1G/rqjMtD8lbO2OYDRU
 xQKaY8W5jOCTqvmIHnpOyj1kHCsoTDwLmirCBWzQTBiaTf0O/Y0MZDwhCb0mUgxuqcLfKlxqcWT
 euSetU5P/EVhpesGiwiKF4j5vkJHyUL+Oneqt55SXBIdLvVcSAIP0rpMvSw5+vhG11514tS4bPG
 0gVoUlnHqY8sul1nXZ5qo6aZJnbXkV+YLaP4lJXYk8t9u3NVPhnJr/lDA/HfT0jHj0FISKnz3rB
 gjNxaeLvyAzYXN5s2P/gjttPJJu+7QyHKREOoi5ppCGrX7mXF2nsNCdAvZaO/wbhwo83CdrQcja
 DvKAttXb/GLXpEFRmhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1NiBTYWx0ZWRfX7bBWL0V2Jt6S
 y10nKxFZoTABE/A5V5sx6uza0zxBmSgwQNE0QYnENoZZ9+RXEpZPtC8gxyPvXr9uDAAlWTx8EjS
 X/FPnntVbTyv21wsdIUpN/AxP7gnItY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030056


Hi Bryan,

On 8/1/2026 1:04 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>>>> please drop separate mmcx vote here and let it come through the
>>>> titan_top (it might require camcc driver and node modifications).
>>>>
>>> The change was requested by Brian, most likely in connection with
>>> upcoming migrations. I think he would be able to explain the exact
>>> reasons. As far as the facts are concerned, this is not currently
>>> necessary for the driver to be functional.
>> In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
>> However Bryan request to ad MMCX and MX.
>> As i can see same is for csiphy. Maybe is better to sync with Bryan.
> 
> Check hamoa - I believe it is the case there's a separate vote required 
> for MMCX/MXA.
> 
> I'm prefectly fine if all that is required on kona is titan_top_gdsc 
> but, basically I'm asking _you_ to go verify the difference and come 
> back with an answer.
> 
> "Not required for Kona we checked" - its not about being asked its about 
> checking what's actually required, I'm highlighting this because sm8550 
> perhaps and hamoa definitely are different.
> 
> All of this is in the power-tree documentation. Please find the place 
> where the power-rails are stipulated for venus/iris and then check to 
> see what's required for the titan block and represent all of the 
> necessary rails in the jpeg@{} such that jpeg@{} can run standalone 
> without any of the rest of the block switched on.
> 
> I'll trust your diligence in that.

Understood. We will check that thanks for the clarification.

~Gjorgji

