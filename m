Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AC2F8E9C
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893011; cv=none; b=o+4ud+CH2Vdw+kiEHAltI0NvJrK20Wm6hrgXWsBClpKRlpzIRWMZql0G4UJbRi2TyFs4zMUWkC7EWyhul/AtMS+KnQdOH8axZih/LQjAlPkviCeWpAoSzNTQDkdpsTZsedQkfxVno90K1rRiZuUBp0sJLqwYeDTveLAdFNwhCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893011; c=relaxed/simple;
	bh=lXxs0CZ6rxUSFR3HmEQeb2UDDzWI+tDVu+RHPZ5dzJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjMFNlotKA5m12pSya3xIDzSgHBvXj4q3ZNmkvVIjjAnOghHk4u1RzdNCEe8Y/j/iQZiOiASSOO/c6FFm1C9SQsjAXuUJBxXNy63vxNDkVs5sOtY+TjUJV6ELozXnTreEYq2Qhb/hdCLPlMZxhlEBzSwZo5DcPuDtMA3nlD9e80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY+g7MU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrSBNHeL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY+g7MU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrSBNHeL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAERbf2853565
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=; b=TY+g7MU2OjXqdfaW
	L9JF9viidT679LOWsPu5p9/dKGhzbyz98zyt3F2n92ll6hsAjOMPQVxirYq/p9Cl
	R7A04mEkUKP8G+djCg3ueSOVwHw4aTDjWHrf/3ynjGHN6/l/fzK+Ayu0PgD9avDh
	AfgtkuZC8k8iHQKCzU4zDWQ+PjHw0Sgj90sKo9UvTh86ZG9EZTatQ3F/lV7U3MXJ
	0NbuaOtxUFTcjA47ZSjbaQ9v/nq5Q68bYEJ+Shda5vzjbhBc+Ciu8ThzpyNSYFJ0
	RRUMbZ/VSQnj15mDS1pEEWOfoa53ZwwzWtPKbaG0cOBcPdraUAsl9z6jy0ICdsg0
	s64J4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtskf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 11:36:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso5006295ad.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893008; x=1785497808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=;
        b=FrSBNHeLzzFokKuW8QaWXQf9dQI6yQccobyXLX+TOWv13vYWHveSo6Vz+Isc5FxRbV
         9WKjBCwJfpnqLClX3QH4vGQHPFJUB6zc0fl7E5aHjVIja8nNU5T98P63B0ryAn/FU5q9
         5GwlsqRYBkncvdrBHhO55S42SEoi+wkGzCM4J5u2qHGbDpLQ4wy/k011XrcCD05aTaRk
         enAXZW0G9rcVjtAI1J/UHBlx+Emr9rRWCWUE8uYii68E3BoazCLpq2aR3AFtzTG2aiZo
         DEVpYMwu/OOWqObVAqwYUHXP4/jOvvChQYShkb0BaWr6kJ0UkBXp55fGljWo8PrJGZRL
         Gt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893008; x=1785497808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=;
        b=rLlJEfScG9+NCIC+angrz2VQ4e94c6D9HDi9Q17tKck4z3mcu+aDkc+PAFRKEcpSOl
         M80xyqL0UOwixIQ1eURYNGm+caQOKRU9y9ky/RS6M7CIwcCF1hwTgC/Zh7PpwB9BiIi6
         YgxVwvmCwoBpZ7906datbcWcCvxHxCfMoScXWcbS57uwGRtAIu7OQQ4AeXEzBrCrJ6B8
         cRDulxkEScgcB3V5nKFdbi649Ul1Bmo9/fJWujh8eTKYd2Ze36qR7PmPE2xm40sUJBTB
         s8eAypFzU8/r73rwt1Kxh5dLLDUBxSE3PSpQoaqlou2gj2gKcDzCS7zz9viaepX0jq4z
         hGBA==
X-Forwarded-Encrypted: i=1; AHgh+RoQVdjUnsttyTJ27bUW9DUi/oz4ja4wWAir4meLXwfzq7oh3rde0fIiZSmT5vlbgsyQA+nBKHZPV0j0vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjSkj+LfzXtundfMwjvErXx/pBhEWNV2BDjgvc3QPooALbmtF
	qovKb97zV9/T3uzEpnzm/Xjseli+9JwhpgUZs14TwcbNHrk1pVE3xzncQ6MXYehl98iqLdqU626
	n8XOLpZojUMQ3w3w4maTizXkCSs5+5N1HpF9z/Yg0F6COAB7EuOsQM87q9DxfawjxsA==
X-Gm-Gg: AR+sD13y6KNu3hSTGqtOuHKnDkZDQIBQ/QyW78E9xJ7EXgWQkvedyGQp0cIpxvne+9m
	Pa9YNxIE1j6rWRrGTAS0Gx56qX43+LEeZH8B6QhcC20ZQoLwyGIZg4k5MOeGxrA56EZUBILmZPF
	ThM7fZNscwF7eqvRy2kNTKAvybdfOLyYFBuCSnPlinPkUx1TJ3QOHiFaOdRgGMO8nuJW/Y3T8a5
	agUiEUBJ6SnFtKiTA3Id9wYDMRQXR/7aCDFp0y64X4LiLRRJjomh6z8c6Y5zBBPG4bV88gRIhd6
	lPN7s9LIZeeLAMR0VYNw+fRTSCFbyf4aXKjf91WoslBREEsJqlE2rUiMieVV5RgoxV0EzT1NG7/
	AFy2BCPS/29RHfARfGCyfjE87lyvOu5Bipvk=
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr8111659637.25.1784893008025;
        Fri, 24 Jul 2026 04:36:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr8111628637.25.1784893007604;
        Fri, 24 Jul 2026 04:36:47 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm30499011eec.15.2026.07.24.04.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:36:47 -0700 (PDT)
Message-ID: <accf8ee6-25c6-4bf1-87ad-d53a11c86264@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfX65b/ycCvivFt
 wxZer7oIMvF/X7DToM9bIw1XTyvGbZwdAHyqNGdBHrFKalPmvr9dQxummHONwkC7k06LcJA1P8d
 /z3+VgT0lW1nGw/oRcyfS6J9KIVoDRA=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a634e50 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M1l8uzcFE2QXb2ngdGAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hS4pzcwB92e-dRWlUKU_Shn67hMjsG06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfXx0SPIfC/F5xx
 FwzVSlqKsFzAPJowT/EeuT9AgOlBjb2ySXLoqeDNQSjSfKcEe97JDvxH0ib65fRy8dOjiaTi7l2
 fN/7T2CYnDkcQRKMR6cDb2W8+Njt+p2i5DJHN9rf8URuc70c0Tvfbo/OFd+jZ3FZvpV6f8Mjoep
 iChHH9uibLHzkn9F/ZnqdkzlHEU3WhiVvyo6kT8I3m/f42kjcJXTnuD2JEfgws59bKw5xu/tUNk
 orDI7lpPYyOKx7sLaJFaZY9gzCSxLWlWESnO0+1JjU/mtN2YTum2KQbjzJltJK4dsueEQa972NO
 AlTofw0Vf/R2X8VIMKL9E+J4NoidDelLWca4ctEwgefzET22w7Y6lZX0joB0b/ycWIjLXdW9l+4
 r0dfhsUR0Vr1gfWPZh6Vv74OI2hzD97xsNeiCpWbTBdK9e+w0aXI6kyDtN+UE3UpTHaZF1gXNuH
 UDIMYnal98BLhVC5vQw==
X-Proofpoint-ORIG-GUID: hS4pzcwB92e-dRWlUKU_Shn67hMjsG06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240105


On 7/24/2026 5:00 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,glymur-iris.yaml           | 255 +++++++++++++++++++++
>>   .../bindings/media/qcom,venus-common.yaml          |   8 +-
>>   2 files changed, 259 insertions(+), 4 deletions(-)
>>
>> +
>> +  firmware:
> 
> video-firmware. Please follow the prior art that existed for venus.
> 

Ack, will use "video-firmware" while posting the regular patches.

>> +    type: object
>> +    description:
>> +      Context bank for the VPU firmware processing domain.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
> 

