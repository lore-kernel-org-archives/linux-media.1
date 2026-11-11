Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402247;
	b=vANI6pzwbKbDS1MVI/43UJ3ZehixQl/DcJnAFAhYE+M9b/zRw4fsyiYZOmyetkU9pNT6
	 zaDFd6T1JdEs0xhL7xlZN4IhcWhxoBBz/Ss7LmMTzI4kksHktTZhbqIOP+m+DXwItekij
	 vd8qIqLVodzunQZPcLp8oSE6kjtNTWTrRGtlyrmbIHV9ozkPN20FzspQ6ApRAun9ooY3X
	 6Uz8DQOwbOYzLf7FJI7i672acRftzZ9ZDdqljKyszj1s5KnCKueHzYoeWBqKJ4qvAu02b
	 RFGfi7t8ID89ZkH2MPNes92yCFKEebPLIFFUvdOe7nCOrU1ZC8ixB7yi3RmX/FC69Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
	b=QnOqQAKzZa4Pk2zujIYaN5ZwTNOKBWCPF1bLulgtyV7FYe9P1uc/9NDzGpKCyuTntHFU
	 sJP7w4drG/a+4dx6yDiPu2Ep426XkqpHLJCrhoFd1Rcr3KpCg8rbKNFB1Z9TVRx76e1bg
	 7Nfah53qH4nAXqpsD67m1/wVKKybTR9rSOEV21CwZ2W1bn5V8wWeXKDqZIXNOR1mwPiTO
	 sRTUfwHK3g1XKwTkjzPTdk2nYfpgTJU1oAd6zvAW/iJm5FiZFrNjRq4wKv09MP9dCMhVZ
	 OciYlTehtJ4uNzIUcUrAFzAIBOQ3Pj6aV2IjHuJ1LgVyQyCMPmxko5EDm4uVeQeCoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56748606A32D
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56748606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYwkU2356537
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hXFO6nUxnCW4XbKSEmI+WWHT
	tNiBaotTU8OUh9DkrJ4=; b=ZXQgzpip5uTvPSftHjwaOcUkWjomKAoZGLBjeYPm
	o1VQ1fRKMILYH+E2uFvWC/UqY3Yc/4Q4Cqy7cnrDFiv4EcuAgnTv3xA+bwMUFWPo
	TOKcHIcBcPBQwTeI6WiNqonqVAiFrS98rjxib8gIQlgalfftVkLQgbSl5+8L9hzN
	2ojK22wdT3LQwRit1G1MrsSzRYQ9WRi5bskOADsWRZ+IDlHaN2bK9DM4sO2KqbBD
	n6fexJdluRTZPVh/Q0Ax3hc2fl3bhyCm3VDwbPe0oGwC43BtkpXpu+dDgqGY0ShZ
	vKLCnaMizQ98DjuFwWT3CLzuTlwV6efLjINJtlAuzKZipw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhwwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:04:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907539aff7so2185094241.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402244; x=1795007044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=CO7diadGiAttY4E/+4kLfuiiHeeRkXpOKDBR78nRQSn4cnlrP9f1b9i+N2TfYtUXky
         kIzJy2WJ1U5w/lQigNsSxgKmsJj5aiH4B8jdQZULkDn+lDYTl5M/6uknK9yI0Y+sNDCb
         NL4aJTRvkWYeHNAZ0PfxZGLAsl9Hu9qsM2o1FY/rFEpYxmvpwxOCMfxib0kbz1iLb7uv
         C8WFBxZwecyQf4UUfaFt2qCHsh9qOWo8GaYMoYYxKbKkRp7nVSX++1qKfaJfCI6dgelW
         4KvAQCMMJBQClZr7Krz6jJR+nDdQK0fEdTLjTxDD3sOCtsb+1+B42veaMJZ6kyKt1j/p
         tG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402244; x=1795007044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=eTjBwANyQQcYJuA7PxPuhIehxyyFTLpcczpJgxrAWMsKzsQGaOHDlgRuFq62GgUEy9
         2AOiipeLc8uOqbMFsClNS4wabr/AHH9l97RUNcNFwTMwS4LX0I7ZRdCh/R7Hvc/qX10O
         iIIAlj3T2z/ugcY5Hp0ltgJ4j/57Sld9q2S1Vn+UVIjplCVILwHE70whSsdTcy/eZ2KL
         usZtTChAW9xwUU4GESBphTvyJChqaNODY2np4OJM0nDKcfAYlfT02KM8HLcwCH1JbwY5
         /o2T7tHk3/S13uRwd6bOTyLsdRU+1okHLPgqaxvMpMZoLNZ95kllJAQkkH3MWyZ3xylL
         CreA==
X-Forwarded-Encrypted: i=1; AL+hErEw5/afuEaLvPLbEMxMlZKBUIaVaCWX+CBjuH0YXQo6LaF9mh786olKUnLJMEvYUGvD+GXiKt1hmLBBSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VSm0q7hTEsBVzMYUOB1BJ15MAaLkd3ne62m9TDlkoNdzhPhwl
	QQDzT0U/BwtPh7S93pNeTyCd3zrvoPJ0muPW1MhagihlMOMXYVLEVV+Dc2dfkO0MEesg2p5vpu6
	DmAXXKL6Ubb4sbNZh5+vbU8Z1HVEbvwdKFOXxqBgD+qBYVYuMkvjyX4+Esj9cEYWOlw==
X-Gm-Gg: AYBFou1xHLFP6NIZ5Q+8m+XCIg7Z6jkCEalQnLu6SZ4MSDjBksLqHFs3B+47YxmI0mW
	tSfqrqlkVgQrT/FkhcdkYg23adrsOZTBYo7YYdbLUdfN1iFR/bqyjLd8LYOQO6ueOPXv+M6e1+G
	eGyl9KsD2N0bfKHuj+4BEXWW9gtJqqdHLzrh4o+w6Bvvhi6XCxozjWLUpCHJtH3x3aalgk7F1qc
	86KdQT52m1fcqaxbo5S98z22ew/bhinLTuLOkdoGTHfxU8U1C/tWaAlxSUBNyauZ+yI18gROtmI
	iWPdwGuyOtk12fEHGNW2iC20bX3Qu9jeANlBFylA/ZY8mBowSc8gKQDDEQBevQqWV0gZvTJTRe0
	n6cVHWWpvW+QpDpFqTZ6ywxkfSrOq794tpnhSh7ZEt8MWOJQmmtVGqHzAybPgX2Hu4BoufVItlz
	J273y8u/UtdYhycJ2HYqvYieEVIBEkBD+Sjekwr5mUUFHTkNIDprmWvfzQpWHhGg==
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604702e0c.21.1794402243968;
        Wed, 11 Nov 2026 05:04:03 -0800 (PST)
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604634e0c.21.1794402243470;
        Wed, 11 Nov 2026 05:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb758esm944566e87.67.2026.11.11.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:04:01 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af467c5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=icXyEQzqa7ihQCE8Zv4A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Z1BQFPI4mdvhhOhyW40_ZxYZfHKcdp4L
X-Proofpoint-GUID: Z1BQFPI4mdvhhOhyW40_ZxYZfHKcdp4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+BTKkm0sn0KV
 gRmEE/e9G/OugU/XmdYIcFN9t66xP0tXKbLOaIvdjIuvKyIsKZMRiVavw+Qn41u90X4Tdyt2cll
 duKfsTEwg7QXva3ZDjYsthyo3m/Ap5XQKQU+hDloNBgO4IbwMUOG2E7tyALDz/dLUM22o2RXcCZ
 mK2uICRH3ECNlZ6GIOFzX5lgzYArifEHU1jVOP/x6WZIRLgrrDT3+2jll0TGgpDZsCHy/MAvqAa
 slg8s2yGBAPZa31fZrsvTFeePMdCer7YAd7u5Xx1/v8wtpqeTt9BdREb8cN/VCoy53FpetMPfeF
 12bYtEcCJVROQAjisOq/sar9wtlGjVRIGwolMu8VFztSlOWitjQjesBwlGRUAvJGbWQ9F4sK5Yc
 69Ag8t8cz7994K68dlYJ9Vv90EGFEBr7NFW5KRFY5CrL6/2PjkaorIdT8/DP3uKW0lHBnr60pDE
 d/LX2/2ulJunggshepA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX7cbV6FtfI2Eo
 xcsO+1rZIrrS7BfYR/g1rh5Wzx90FxRC4VzkHHkilElBZTqXQNzCZ5cjwlaZwPd3H8CNpEXlarr
 5ljg2rPS2AmBS5sS6jMl68m7FbVlXGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> The OF_IOMMU code relies on OF address parsing helpers, but the
> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> annotation to handle configurations where OF_ADDRESS is disabled.
> 
> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> preprocessor guards and __maybe_unused annotation.

Why? What's the problem that you are solving? Why is the current code
bad?

> 
> The only architecture supporting OF without OF_ADDRESS is SPARC, which
> does not use OF_IOMMU, so no functional change is intended.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/Kconfig    | 2 +-
>  drivers/iommu/of_iommu.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
