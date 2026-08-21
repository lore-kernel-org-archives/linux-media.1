Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1241378C
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294091; cv=none; b=Fmzl9TeEne6UFWdtuJdUge1WYTCiiYqxGQEIaPNX4j4kR/qDOcTVtywEEu+0tzonjqNrYzzN95MMGwPn+Gv9nciOIFuyKPCnacHJA0fpUqXEuyBXSSxxwrxePsNOB5nmGVvBb9XuDoJajHxvKcxI3RrUjq4fhCBZ/MmK8lBbfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294091; c=relaxed/simple;
	bh=PTtUw1aBvRTFrGS1Xdi2jShMywNyldzKbSOrkVj0R4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QexWgP/JyjYrVOdHEIFjIuJJtR/yL21p8G/61PtUlGkqyMJvsNF02Z/8Hq1mNfmJlqohCbt/VT+QqDUfmY82vMGqG8A+0cFAZwdUNiE8D3KVe7m26j750HZ4Vklazfhg9uxjaxtLED3bCa/ssqNLqcbBmjXYacj9/1yKsalkqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQHdeUfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFEOiXPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQHdeUfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFEOiXPG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5Tkre1796423
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=; b=nQHdeUfNpfGoXYbl
	CuPMJxh5IbaCOsFc+b7yKMoptq0NuV4RYrVCoAgKFXLjFXtclSJaUJv9YSje/87y
	GK+LM6Xb/9gN22/DnHr9VEjbDnHgfPTXFQelXsWp1QsA4cNgtA3J6D/ijvxGxMfx
	9ntHvSVAC+oAWobXWtSS2iC/QyD1Z9iBHv8VVN1oEGwkgJD1waWLY3wHw/G0L4jn
	dwBa5MoJWRlbdVh+gRu4WZxFGpJQsp2AjYdl8lQqC9Q/8wFL+/Htl4n9OzCzk3U+
	ttSi6ImAZcN04AuOyzd+cWvp4m/4fESHFSAr+kd9HdfCGQ8kVYzVXWFpVU6AnFry
	zPqvLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf07eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so757084a91.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294088; x=1787898888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=gFEOiXPGVw06yPr1CxHUuP1Yuh8OkEVmiCzoURIymDPQH3SHXbJ7LabEcCsYe8CfxI
         T7J+MlPo5vbwhejcq1uJ0eYzK8QfpalPy6HV3uUAEuu8Han4K0g7y0sgpENHjk4VMlQR
         RMv2XsRG1HmKDNGKf/D7NK23E26+/BW72uS2l9BhCbnY3CvoQdrgc483/x8vv8yBl0Tc
         CK7n4uSstFbLAaQpq23S/a8Os+IknLQT9ynY0vCEhreiZgrcTNhsD3h6zEdU/a/6xrtd
         CzNiPpUwi/zmcmcuHcJMjsGQquawDo8HHIFFalJ7sMDviEYC2+l6z43EgfgP6KG6/yof
         IgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294088; x=1787898888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=LVe7HzFyLkG27uTKOnSmPcRTyX12TxqMcX4XesKClIcu2RTqMnQ66Z8HWUnIYFIj7c
         rhMhxqR+qvPTml7qS6YLh8tGL7mb98QwpO8dpZS45iWCZ0lBXVP1nNKQjQ74XsFxuN0/
         ivZ7puhuuQfsZSCMpkaVTBQzCPBwPCMlnQ5wLNakoas0r9zwlWHmDX4U/DSmORpN82JR
         AIAWGn0wh5T1B+HZTU9nDYWljTMPXDjs1+Msy1rovXrcqLj0eN3YaWsvd8susQ1n/Ybw
         WJ0H6C4UC/VoM6wKW6R7NRzWHR/Kltkan+HHzW6Qg7eChQI4qSprBC0jZL7jrSAlcnug
         vJUQ==
X-Forwarded-Encrypted: i=1; AHgh+RohK5680zAIkWHbSKUrptofy72ImsrV1VbKdPtadxCz3W9RHiblm8ulyqqzlZLMQKFw02QqLVv5/JyCkA==@vger.kernel.org
X-Gm-Message-State: AFuF++nUg7xe9M5OaoWCQQyiO9csu7RFPrZurVzAcLCmPaNmFTrW0EZu
	VVR9+wPnlDf744XI5oPBlEd8k+uDc5MS8W+XQ7jey1Bs7WVcvB4oVwxFbBiNBCpWaheR8YY+RmX
	jsbVOtj2S1axOyDcTSrG9iyTrYC0OR+i5QTCLnb/zhDNi2afYamtrbdOIXedXhtNgJQ==
X-Gm-Gg: AR+sD12D29CNNbM7Xl7A9ZLYSRWjjYJzy4EDmBKJBOGdgayIZb4Ics6mtbkx/CrENG1
	ATsgA7BvSKoeRfGmvtYpV7y0r39psxiKk5qR7Mm0PqD6VBH7DYhKrZ+wvjv5UVvDlBJeXu5+Bww
	R4yuBQjOSIcVrb9r9qdQX9th8ePwqzB2Mdbk1TY+CSqtf4e7S1MQH8psZGWJNpR6eb+ki/PzqiT
	GhFt2RyAr4qMFgmkVOXDKh9QDakUfXArpW8osS36zzRrilLBcev6y2UNXXDEeRI/Vcfrum/li/f
	jmaduvElY2Z46agX+UYBtlgKRStnIuiInCrFzs33ub+XllTG84cb2/H26Qa7bwqUFYbTDu4zNkS
	iyliOO2SZ+ZTvnNP5w3q0cT26eioncg==
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831723a91.11.1787294087790;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831667a91.11.1787294087392;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be445fsm1772969a91.10.2026.08.20.23.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Message-ID: <e2cab6c6-a5fc-43b2-96e7-f46f9a7bd20d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:04:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a87f188 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VQr-KVQjmy1A4l77MVwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX/VTdHzcnHj40
 G+2i7QycDHRh5rA/XXIGS9yG6kT641oLn4BMtgk6F/rk7535uT+yCJ4Ti7TQyO6+5kb37yursnB
 KTT6V6wx6mxXs16trwMi+GJpugxDUkN45bRYLL11pHCsbVChvd9Tmq3BuZWziBQhFPO6ITKs336
 IyqXJYxetaCHtRMiPXIWvKby2e1UCdlBsEUADiOxsQcqZp+HABtrHtJZ/jOvazbDrGna1Tzln9E
 sFxN4sSu2a0j0PfkqLFOeffE76oxPhrECPSMzUYuIZVSO/+Epoc83BcD9zjT1pfrn4q/K4Y/DpU
 4SkGziDG4aTgkPHQcxM21uvyicJdGcrw40oOJ8rQzD9PJBwOdm5324SVvErM9+3a9ZWAeaZF4Xg
 q8FE1ugWuleSx6kJDbDqqoJlH0mNmMOj6WEebqyZv1xxi0/fMqzURx61qGP9OR2Neqgsh6Fc5xh
 t550XUWT/eYtQ08uBTA==
X-Proofpoint-ORIG-GUID: L4ed6yGFtUqw9vhC6ASP_awFjg681iN1
X-Proofpoint-GUID: L4ed6yGFtUqw9vhC6ASP_awFjg681iN1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX5OWBvqEW8ni1
 R24bQUwwoe3j1wXYoEo5eT9wx4GwThj0cli8SbdOjpTXXQfTmIA+sBd8jKWs4MhDpNW+Fe5zGp2
 DJJh967cju+U1vtL8VEEU5Jv+j+Lub4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210045



On 24-07-2026 18:12, Loic Poulain wrote:
> +	.start_streaming = ope_start_streaming,
> +	.stop_streaming  = ope_stop_streaming,
> +	.wait_prepare    = vb2_ops_wait_prepare,
> +	.wait_finish     = vb2_ops_wait_finish,
> +};

Hi Loic,

While reviewing the series, I noticed that wait_prepare/wait_finish
callbacks and their helpers were removed in:

  d0730006dac2 ("media: vb2: remove vb2_ops_wait_prepare/finish helpers")
  b70886ff5833 ("media: vb2: drop wait_prepare/finish callbacks")

These stale lines are causing a compilation failure:

  -	.wait_prepare    = vb2_ops_wait_prepare,
  -	.wait_finish     = vb2_ops_wait_finish,

Please take care of this while posting next ver.

---
Regards,
Nihal Kumar Gupta
