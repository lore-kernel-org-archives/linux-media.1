Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492264;
	b=Ros71ltEW26wSBOPdGxmimqN9lcggq46cyBnxXazICTrdysll2AQzVif5rBM2rCBGLy/
	 aAk6ngMzf44Vq2kAPGA15CPeeL+pFNnP3BW/y4ZQPQpGT4snlpikzlfoqyIGfPz+YrSuO
	 Rt5pBUGednLPXCwNKqYDYSJkf541mPDJOAbOIJILL7yGqF4KcFlFBiS/Qo6K6ujXpeYhl
	 zwhNhGqer/cuK2WEshL3C5ll0jxoDOz0l40MU0sIVQvFv94fsIH+qCQt36/4SzqaS1seD
	 5QBqLu49k7c5gwLfOQQYVieQd2fSiiKZlinfS0bcfWmZ2NHXE/UF8us76W5ErQMbPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
	b=geIQbAE0lV+eTlpJnXe0fuDpTdSo/pcGul3nzfgw5dJv/p1U1tdOcVjGujZK0C3TSbmv
	 Ym09XvDJHo+ygDeH0lNmwZj6gr8rg1Y/Yj5YcLNRRHqbEvl7RWQydNCcbegkFBH+m5O/L
	 gi45SXLgHYyv+Iy6btRvX+wy3V2JEE9VovjIdXa+KC/x9VqBY/QZgMaKbJriOh5wM0e77
	 9Y5pxw+YawdRIOBdTZx0TZ5IWrZYXSDekp/099AE1HYJtjhPhabcOda440wJALT/4EMLP
	 7VUNYSAGk7uP6ja2/GY9xjGeKwqnjmANysW+fe8dzCgUhQiQ2NoIe3IaSXIBcwnYnbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pt8mT/O3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714CD606AE8C
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714CD606AE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pt8mT/O3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmlhN2555516
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=; b=Pt8mT/O3E+MdfLZ5
	irvIgS8uLB5HnZNSkjqw9uCkzssqONuDPOuy5kilOtAmiJYPSUIGSxF9D13buTDW
	+aiq1LxgbwgdvUSAxVbw1ePXNqBwO48/h8xDkJyoNw2v5Sye+5IkGZ5mYZBhXSek
	9IbJYB9tIVir/trXeHtT9QBeG7HdB6KhiLrlaeALCLDPAhar3kGWHDWv5bKoDo3y
	b1Dsb+rh2gEqjZQn5RcwKEHhw1XJjnEJ/9RV0rfBb56LC0GBgri8dlL94paAxjrr
	w1g25DSeUfIxH8cy9wY4Y9eKbEvUgEKPcm3YmIbx4AGfryQISQPQZM7vH49th1Rc
	Ed87YA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0n72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8127548eec.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492262; x=1795097062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=Zkdyv7FZMAup7d7VcnxaVAem3tfHj5MSFqZtrqcidXWFs7hcaVhX1gf27oHzB2TEEB
         kvMkGB0vbGlN6Cd4G1y3J3mO1SN+/1C6MGibdA/X4cUpEUXNV7uVokZvfuX6QJ+Poyam
         zFs1Kc81Xes1FcQ9nO/+M2sg6VuLXuIdD/nHbbswzwV0de4ZZH0TVrlDt6tKfU1GtRI1
         qhvF4mjdOIDWI3rrbHgEk3cUzd6nn/pxW02mCQ6GM8vh8zJThB4l4CWFEqOPXWgftQiw
         iua5SuEaZsKOZPSst79yXKuZHWDTzmjEXt3+cVkHS4UhCuYfJcf9jA1Q7mA3tr0SxscB
         Me3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492262; x=1795097062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=aaKEFrYaVqbUbnEmaC10AuxPcmZvnK5SkVGmecqc0D9ZPGyxZgW2LamJRRjDHoPvzL
         CfT2LyheyhfoG9BPaQy5rqTKCzS8yXMj61BOOrwU1Ys7aTA3Xt9+xXiJx9c9vIT2wIGo
         a4ctIkEDkS+yF+Qyiss1kycu1ALYubIsy7xtiHyqA9qm2KmkMrLkpKi28Vb+h/NphhDN
         D6q6ua/IZelOasj0gvTlZThtUku9gtH1OlBSaOMVbR/z7HnvtD3T8dZ8G1qpAXkrvK+N
         oVOCG+qOKUohVotN15vTQz6bTIVWXQDxrPAJx36s4E9+vetZynmU5OS1bFadeg1FhmON
         t9FQ==
X-Forwarded-Encrypted: i=1; AL+hErHhcTxMA+3lpObXBiSTxC780l5wXcFGGlqYcYlZ5xM/QgkXDF3DwcYULMvQTMPRze1HrRc9ONA6DfQJQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8I86fUzJZbKlXVTELn4sN34elwK3HRMjk7GTKDAUv6LW0XCg5b
	hl0EpThzOV8ZjZyaRapp5AjvstqltBeBuZ3gXyqOizdTOkGjuEIP3ij6uZtcvo/gPmB68axoyh1
	r/HcXHzgx2OiuTm4oMFATc2UnjyyilTui4nlm23wJ1H6pmACf+MuLgIbDQ5PvtXFgyw==
X-Gm-Gg: AYBFou3mDt39x0g2cuFUgp2Y215I2RBN+R4xHXOKAm4hN+WDY84OL85iCR6mK4gsnhL
	n/NRnJA3IT6SlurdCRp2QZprCh3aLZ3g29MctBipaly7RLMX3oYiN4hV3V2lK2c5ypum8lt0kx5
	F52LprGjKt+lEl4MN3zw/S/F9U4X1MLRZyoE8xgehePGmA3wIzLea/6Ph3OCwe294UT8axwxaiF
	bv4LHK+9qMn3pA6Bv1WqmNqUjKDg7n2LbVQv2ppBmKeoAGh0Mxo2OhFsIX4TEYIeiIlbdhlj3rS
	P8NF6ocSXmclsxWFPMS5+v2MJh9jDtxf/M6p2ytbWFbBfI1zkKsXZH+Bgu9oTOLRNBadMqf11DL
	CvgAPzi+yqVYaLaIH5dgNQj86E/q/1/hFbtTgfvGwDv6IUCVubZQogFZdkh5xkydeFimA4TS6Py
	94Epgm
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854446c88.6.1794492261713;
        Thu, 12 Nov 2026 06:04:21 -0800 (PST)
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854412c88.6.1794492260879;
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm14027c88.1.2026.11.12.06.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Message-ID: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:34:11 +0530
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX0/ukpWJ0RoTP
 dON3Vppw59+bcyFL0lifiwXTEOSqbuuvsmMwiaW+2EF8QK7rhDQgGgshNWk1K4m0QkZcGVbX/4A
 USK9j1ZbzA6TOPSGD5UqTORIV7ysCso=
X-Proofpoint-ORIG-GUID: o5_HL4-toCxKcQUwWSD0fgC7X6tAvE8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX26HpMhvZqiTe
 gdtmtlLOv9eVa9kYCGpTXAEWs+pael2YHgTO9cO8j5+hvuH2ZR6UvyJvuv7DXKuAjvQ2nPj+LB5
 noGQPM6Lf5EpbPZdHXSm9mzRm8mZppwRTGWcGOUN8+lKTzPrd5NTPpWSPkUYDt6u6ElkLZxneLe
 wNttsz2EKlSzyInnosu9qjX+NUJSVPinkjvcR5EZmUTUj/Qm89DtOwL2pEbKMF3GVF+spn0jpb/
 WUCQasphfFFkPSGnvLp0phIix0MVkX3ZoFFrCIwKtMhXFI5l2QLIvkchg2KTC4nEcWVm8Yqg04i
 pL1+GIqWRgi5zrOPQI4ki/LeEHGEb3Mate+bWZuvVCeGih2S4/UzxjstD3rPzBfRndJWsil9xWG
 puy1fY9lxLwfv0nW6gunh7saQcujCv0143/akomzaBMb31obxYGTZN4vgyHmmVuGsm1JYXYDMOe
 CpSU4n9XhEd/s0M/dlA==
X-Proofpoint-GUID: o5_HL4-toCxKcQUwWSD0fgC7X6tAvE8m
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5c767 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=DrYjplHx1sOd6opfFz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055


On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
> On 06/11/2026 17:14, Vikash Garodia wrote:
>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> This change is not about requiring a reg though, which is why it should 
> be a standalone patch with its own justifications.
> 

This is about reg, which determines the direct mapping, hence the code 
is very much applicable to this patch. Please refer this code [1]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/of_iommu.c#n223

Regards,
Vikash

> Basically the patch should state why a mismatch is dropped instead of 
> being reserved.
> 
> ---
> bod

