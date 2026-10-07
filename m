Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBE476CF2
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367062; cv=none; b=YfyLoXK1Dbfnd/v+P0SOXIwtbH/zKZ6QmYw866+SREN4kD1VLZBzoYVfe1BOCkJ7lH/E2tkFEwnMgmjKaCWT8jqe1n+efp1Gu7M8NTErGTEc6qKhVuKTrPpNlczmLCwSmTRDCHnEvxd2G4+BIPFMPea0M0J6MviIe0JOX1hZkHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367062; c=relaxed/simple;
	bh=G0D7fnoSmrBtX9XsPaG3Vf/7Fv5FbcC6uSXd9+bMZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuPe6VyYjIhGBYmp/522sFFBvXL+vpooLY1CxmiFYdv5TUtP1GpPPdGisbYbypwA3BBhRG3R8PSEYc0Xuq73pArBJlI8uzE3mzT0k/xuOg7sd2gH32l5iHlddrlyQHhpZk9LZ/hpuy/IfA2aTo0g1G/llibbjw4loguF/y88zCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaM0xPUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+qovThl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaM0xPUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+qovThl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jaXf1873502
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=; b=OaM0xPUIr/C2LT88
	EhKj303oqBT4P7VR+QFoXkgtBg6WuWvT4iGJqKAWlZ21/WFmiORHbpHSPi1DrFdB
	eFpUHcDuEzTyhBojLjRacmwrNhhuR5kx11wN3hWeqIX2i2hz60sT1F1LXqD7XnUq
	nXmIY4hGsrj93CzFXipvv+inU5IDM4YvPFevwIqBXzzsCeQYbc8LneI8K+ictUyb
	ox2+WNV57VN8s72AXuPXsW00RftniTzhw6qt124ynhpXHVjWEHRo5xkWk1gNw/2d
	A/8FkxKDow966SfDAcRNA7ijrxwTGWTPlw6o3ZeOHX/OETHD2mROTT5P0irf/1qh
	UlqkQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rujg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so866348785a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367052; x=1791971852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=X+qovThlw1qtU1oSLkZP6m+XTqn/x0S4A+aOVvC9o0huFYGiyrt1iFih2A/UJsFfhL
         XOnGb4OjDuQrranA1i32CQD5EppvqxofTh7pS5IGoxrLjGQpO0yd0m6asI+l/id+XHJa
         A08S4wiqIrz+xkgCKb3ZyVKQYkUDAgjLJlfQXNw7y3O8OQeWZg3UUGvtuJQlfFCBEtvN
         SIijp47Lt+BqBVI/smCeIbUVtWotAyQ7BstQrGp9085Jl9rm6SiKhVuwIV2+RvgMkZZh
         7oxJIcAzjkG73otPdHMoO/uvtkD+Yhfa3c6uBz3/UsElGWxEMw3XCTjMryB67w+A8bhM
         aIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367052; x=1791971852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=IZYZeeMJiyvNHnciIFCKLcXhUnr+tCuK/ik78pgOxniRrZtb1LhBipYCe2hzNMzQjj
         I4wBCQ3UBxPHH0aRZaFnKrE3sOrl9eth83AE+RHnlsWmbhkfXCGklx848RPSVuM4ZzSi
         /bsWGjJiRiX0+NkxU/TQKJRCMefBJ50iHcJOpFpup0cHgkHUoQlL1vHiYcLSOryX1Ser
         PyY4eFT2GwFkCC4n9a2FoYXecpxPq8KaRGe63kLBckMAvqQZQ+2JKVaKT1dCbK4H+yPU
         tJI0GyJj8I5dE3iRVT/sqvZHkJzimMFxWgFTufrAAzaskJQV+WH/a01v8tQT77L+5Gtr
         114g==
X-Forwarded-Encrypted: i=1; AKwUvBziBqwjzTGrP3Go/STTBo+je+eBhp/Xd4/s7MSBc1vHkZVmfkRkVSUyBbvjOSwEUtO8zbAtsCYW4Zd11Q==@vger.kernel.org
X-Gm-Message-State: AFuF++ld+XHIGMbRpKVCzY1ImEzODo1E3KqMPro7iklcmWK1Qb5kSaoF
	SE82yPmZpE9aW7Sk0F4oc1NhOaa17oT/1l+GveFzPZFqsVIKFufmLD2Y+ETNk7nThQU7K1yoK8o
	yI/0RDUqpiBSLjWcv3PjRjTXU4edpqxwWSqLO4dt4ifdz/TWZw+ja153rOqEeAb1wRQ==
X-Gm-Gg: AYBFou0LqiscUeYvU1vFct9IkwyfCJ+qYIK/Z/RdjPNEfxblg+v4i+Szkagmfr3XKnA
	j+u7zP5+L0xiJAzTn647BMLkbnyFttvjoBcing18O4UZPJlVEfst0omwnqJKEDqrtv31Jh9rSId
	JJAg3XPG/bPKE+c1GKNTxlf+xmjJZ1yF4OOBRixFfqWOQ/LqUY3wsruySqxYwxvMjcgYZFIhTQz
	AWhPyKi9lpPoy/H1dHMORqv1MG2lsLtwe3CI0kt32vofCiaVWEo+YZZeu2prxw4jlrmXMcyqM86
	hSXyLCdQX4OCea4zSCD5nh9N2Pe5xzbLdI25N3aziuQYhzVVoKy25X7iA3Wo06AGJWxGUWLppet
	FnmiEsD67jZkvLTu/UcuW1FVb8GsVK0TCiD0dKtjY
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320213185a.28.1791367051846;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320208385a.28.1791367051241;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm178374325e9.2.2026.10.07.02.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:57:30 -0700 (PDT)
Message-ID: <0d72dd03-8500-48de-a78e-6b99a4c6fe32@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:57:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
 path variant
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
 <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXwkx2QR2uMNQJ
 pXrGOEp58acgN0LLKrntDsDpLpMlSROsM9knbbogn3rcBbBOim/l33pEOdJp1PRR/8tqAgmDw2s
 OOTOHzCt8xx7Bx11Ke7xi9tHRbBrnNw=
X-Proofpoint-ORIG-GUID: fCfOxfS1YDKsV_OE19bE7Rbk5OEdScLF
X-Proofpoint-GUID: fCfOxfS1YDKsV_OE19bE7Rbk5OEdScLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX1CcaELT0uiV4
 j5aRnzaQHP5JQ0zsEjfZzi6w7yizyJ4N20wHC6Pln8wgZ/GuqI5swSqEXjPw+GIQ7YfArm/eRtR
 7iFjJLTuSVE+M8wEAy7UWIOQsO8RcDH7KK1StY54biFu/RNoW9ffZrY5dQ9EWh6Qs9qW+G7uxba
 OLxVvnLTR+oRMqu5r9JxDkZWXdcxevPxwEj1HSXkPMD0dNm3AnknLbsZRi9ndbIQT9NgXM5svCT
 JJVc/RmOwcBucLY9ugmcYMGI12FmOSZ4q7++FN78RgDGEb3BXcmj+9qztWyb+BLd85VvcpHgORf
 oeX4OrmBsRhLVB1dcFEWcxuHIBVRrvGhlapo0utY2MYpDRvHsogRYVyvEFdGv8FYKdsOt2L1lWK
 4T8moRSqUbj/w+tO4Vf0b+oArT/TErOc051afeGHYPGmrRQlEqmswLTc/aNKfO1YTqrMEnfhBvL
 re4pY1Fi2k4NIoa5RwQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac6178c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rnyNrMEuC2Fy3nUAs0EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:49 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
>> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> index 48f280e99809..9206c7cfe197 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> @@ -14,7 +14,9 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sa8775p-camss
>> +    enum:
>> +      - qcom,sa8775p-camss-pix
>> +      - qcom,sa8775p-camss
>>   
>>     reg:
>>       maxItems: 22
> 
> I don't get why a new compat is required.
> 
> Please look at my RFC - there's no DT depends at all in that.
> 
> The existing CAMSS node has been designed around the IFE SID - not by 
> accident - I've been pushing this for months - to prepare the ground for 
> not needing DT churn to enable IFE.
> 
> Sorry NAK to this.

Yes i have expected NAK. And it was mention in cover letter that
this option may not be accepted, but it is convenient to test new
topology. Anyway as answered we will wait for your new series.

BTW just from curiosity do you run parallel streaming on pix and rdi?
Does the functionality for all streams to output in parallel along with the
statistics working?

~Gjorgji

> 
> ---
> bod

