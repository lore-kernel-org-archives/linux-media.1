Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402101;
	b=kV+kX0jSpcNONVv73xCIFd5tH7DMzRM34rdkx2PlbdpeiqVpbFpsbHaFnTOHKBxun7gs
	 Ep6mvVL13+lkauMoEycDOihbwR+GRi1EyZ3JaiY/8rTE/x+docwM/PjOathpb441+o1wR
	 ISBeQUFNApgjYKl82uN8TQ67MqKRdx3pQusdhhH2fKlVj7HyEH2feUxB8YgNaWIs76Vrw
	 OyOUs/d1huiNgEOPAQ9kJhXTZ2nhD0FFjZo1IlR50g05YYdVoVIw531nYybofcsTCnewN
	 aXytgb+WcfyvHD0bdNY+JupdcNIQvEWOPt4sTDL5LP13EZcPQQTIdldRPcfqHr6tsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
	b=5DwtO207oclyl9d6mj1edg/fqGRRq+HRF9y1TMQsDrSp65PDZxTD54svgisa4YWMNO1h
	 W52ldNzSWxSInHu+ls/B6OAVqGsV0VOGGncOXS0yGNuKkF6D1YRj/A+vAt+oq8XO1csEF
	 EzJxpkoLjKMKHELGAG7pe75L1wCymi9NeSqek5WJ4RN4brVDOX/JANXJegxbhkU3Xbw1F
	 uHSxAE4JMH+QcXb04FGUWJoG6b/3v55No6/Q6aJcJUBuIYL/smePj0xpX0Sqxj0bR9LqH
	 9Ii5nkOx80e0HWka5UfeEnYjn+hgR6WFihxhU2nDitAWz24p9wmoBvI+TnEvQkZEFrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1195606A32A
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1195606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6q+meWf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ahN0Ajmk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZCBM2975432
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fNNA5DINfFRpf2eORoYgUUVl
	bLJUUgtkmYcnEbAYKiY=; b=p6q+meWfh8pxTAsOPcNqXBXxXBRbH+GJDC4uiwKA
	LJ5hYTCU3/k1FKYji7ugZnbHErDA5WuhE5KzDaz8lgoup47Kf0aitPgAEw3rW0lp
	tMtswTpUYDD8q4tClQtiOBprE7ZUy4pXagV9SgI+lMAfwYQfVHVebO5KPPIcUnid
	chmnqaobA7mVsL+v/gdx+NJL5U1KFoj9M4mB1lr2ZMcQaWN29IzteadEmIgwVhrK
	EIpAcU2xW1xN36ygYXdO+5SKN19CrB5t79dsRs5D885Pvk1tYO8MeB2FCyVs7Qv2
	wejjCK8v+qWke5jhjykBYz7/jQCHfyyuSVzlG19XahwgNg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbvj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:01:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83124d530so3684764e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402099; x=1795006899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=ahN0AjmkD63PvVgeHmTW9R+4V623g7CKUjFoxTx/rILg6XoSPLCx7vdHPmEiblcs9+
         OXFKV7KwAzlj2DLe0CbFaW5Bl+jini2AbY9yNuUlleNQsjl8UoD/rLmNakZWu011wDRz
         38XM8LokSGsfwigtXiC7FcGwIKOc7I2XZxri8d7jzBWcGK4gC/ypzwPsIgP4XWflydYe
         RvqfloJW/9ugMzKTVIOYs+R/w5gem1fhgrJt9duQl6Q62scnAmDmH8VUXAEEpO75agNy
         j8BI4XUxTGkuy4yAazi5PoyFxyec5jlQglS9mkW6IXcVyjrruY5FmAnPRdATuGlT8Bjm
         HNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402099; x=1795006899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNNA5DINfFRpf2eORoYgUUVlbLJUUgtkmYcnEbAYKiY=;
        b=cVai0ONkDvOxuVOx668s3kkaA4Z1RVLHczIM92YrZrSv4a47H4FfmfaFENOPGRaXI7
         nmRnN7o2jDstfl8AaLPOTbIyr/f0RnBJFGsuD6vKfRj2jxteNmboC+aCLJjiV+3ybvvA
         J4bZgf5YrUVLeQQKeQEmV7kvDyKKoCLfHnfLjstU4PAUqUDhk//gEPno70l6Mag1g5v3
         pxyx+7kXr5TGplBwGbTPiyWscJ1nld3hFydVgqfN0jTvH6ZraPA67ePJKVYiAD4M6Xxb
         Adqgw3yOdfRwQKXU5qhM1VeA1pm6A1gB9hg89CCy6+YFcBhEVxA4BOEIuMDb5rXNxR4v
         fa3g==
X-Forwarded-Encrypted: i=1; AL+hErFHRRdYksfYWYq/9Ur5+ngM8BCydhJ4tKolyVOOhjnPfaP6S5E1snFySNm+A1GZB3zY+LRz0pqxSbu4xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+N463gkYc9WJVBQzLHV/fRW2RLGP50XmlVGWa1kFmwvefc7xRR
	8KUzls6CQuJdNS6yY8l/9Y3k1qKT2rGQzOugvu/zkC0XK9ml0JXKPaAggQmnsTqNASGY/GNrP2b
	1Lbn+90Q3MMiexDG6+jr6NmK37sbGfWct6TywrlnEJ0dl3e6QD7fJE3ViBW140SerFQ==
X-Gm-Gg: AYBFou2bmtZoh5Fv7TEXvb9Mig3BhApyvKaktfA8CAjo4DvX7cZeVDn5v+xuWzGJ/HQ
	P8zZeOqWEhNgQndFjZMEPaARrhBJ0Iue0HSyM7hYTbIlLfeTZ0eOeA8pLlgtfHB32pOu38Yzq6a
	mEhYQbKfvMDsNcPZwiCrSd7iElVnuApOhKMc0akPXFHG+NpwsbOJo6IMUn6dgPlhDgWf90acT2E
	b410/+vomEKf3FMP81fV83vdAUZpbtcgzZRaz+uDJ72C3CZMDlCfyrXr7fCy1P2vZBh0qlKjtxT
	A9pCkm47w/DKeInId8P/aYYmaHwqxsh6sAkDbNr1XGg60Y/i46XDkNCEvLaJKYUA7CWQDFeRStK
	NWyaRsriH5NGpl/l5GPvcAAMfr2rTDcJx8sMCFIr9anAGERvoEpv3dAPrrtn64W7rKlQiVqIkA0
	wHN4J59ROXBJtypZjFLqmXpO0+rsOy30iLizuMgIQFtv9JAHIwjy2zlCI8Om6yZg==
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672610e0c.8.1794402098944;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:d12:b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5ee1c3daf90mr672510e0c.8.1794402098347;
        Wed, 11 Nov 2026 05:01:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a657sm947505e87.11.2026.11.11.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:01:37 -0800 (PST)
Date: Wed, 11 Nov 2026 15:01:35 +0200
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
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Message-ID: <h7j7lyl6d67xfdw3gyabfngpurumbqd6fkcvuhyi4juashcx5r@egybwhfdaonn>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX075CaTEwF3/z
 xB0oounYgG4ifPKW4byAc1+Ew9Nmrz2NT5lTrWnOtb5dlzwemRBT9oekJvJTRysFTPTyRkZ9/IU
 dEEdcBMPEvATkkIiO40S72MjhGCuw4MQUF//yTw7ey3El8a3UfjBCMSpfITO9kPtaGCmk/96qSD
 8LVFBTKpZg3f3sDteezJtXLP7EpDp3vGY9l8nKowmtWs9yAL1CwtaFv6kXRpfSIrzMgFR+PV9SN
 ZEjv1SlR5RbEaGSX51l5OWUhwKO4KVcHwJpBrx6i8DFZ4fUYzL3FbVWalFfnH0M//3fafyVGvtv
 zCUn3CZ0n1oPPd2YoESOKLuHzjcc5lO7RobW3WvnkIV6y+f+pN0Rzp2qZ16CtMXSLOW0UB/DA6z
 Oi7ikCEZB59KZLyNdZFJLnRa260KeAFMgZGCUNw4Tf0MXBuDEm1EN8wOnBsX2TXoRkSn2P1hb3D
 icKstlJz2VAMRULi+ew==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46733 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ycv8Z8E-TvjlFfbjzzEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: TSI5op09Nby3-pK1FT6Z_502Fc3BkLNW
X-Proofpoint-ORIG-GUID: TSI5op09Nby3-pK1FT6Z_502Fc3BkLNW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXzAof5rKshoD2
 mqeP18xJyXrpJpqSiYOUjY98kbZrZKJHCTD+Z8E69VDLA0UqHpQf7AMF8Sjo9aoSiqfEtMqQMO4
 YNjoD/U0WrM1ukF+n3LEi/5+YoZ3eTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:23PM +0530, Vikash Garodia wrote:
> The series adds support for recently introduced property 
> "iommu-ranges". It adds the required checks to error out for cases 
> which are not following the schema definition.
> 
> Iommu-ranges was defined in schema with this PR
> https://github.com/devicetree-org/dt-schema/pull/207
> 
> The patch series is being posted as revision v6, since the patches 
> were initially part of the media series [1]. The patches are moved out 
> to get review comments from iommu reviewers, which was otherwise looking 
> as a media series. Happy to move this back to media series if anyone have 
> any concerns. 
> [1] 
> https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

FWIW these changes are also required for the DCP display controller to
work on Qualcomm platforms...

-- 
With best wishes
Dmitry
