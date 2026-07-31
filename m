Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F42DF719
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507048; cv=none; b=VgGEy8L4D10BA34f8H4kfHdsmn5asx9B1+FyJG1+qrRP6i7Ku+RQjnxrRWXXAMIVC2bQi8B7cWL9uZI3irt1HXm0WrxN1OrVSD0+qy5GBzl4txLz5et23C60oqeLf9nbMgDPIfpLDzHq6cjKEO8jdEkqXI9DvbRx7PjSs5OTBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507048; c=relaxed/simple;
	bh=/7KWAZBYn6MPFsT/KNM9BNdClV7cU8L/90QgeBsjtag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3lHtP0W17fYAYOnRR06zG+R9VshYFC5+0cceucS0F/IbnIYRjmp21Wq/TmbCA0AafP9itavCpyTRDzFbJ3yQm7FNLLXnN6nFBVbOolKtUUZJ1oafEpslDhBR/5ddtPJ2imVAb6AAiSPkIenzWD3lNPdWmwnAqlXotZ8tV0e+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVy/Ejem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HapVZGUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVy/Ejem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HapVZGUn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCHi18058215
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=; b=YVy/EjemvioqFGgB
	1zdu5aJW+Cm8JtIxWeNdb6BXgKj/82FjDdNu7tQJ7rJSLFFEZzz2eG+aK2ISAYe5
	9YF/Hpq7b2mzJ+2owBXzpzxZ2fNpzc/JQhl0f5eqnvndUo6LDldkHSRGjqdg9qxW
	bDIdJnGeU7jIprLeJgnYLGYs191ngFhH/QP2x3THazbvhO3lJR4Xs+VJpDvmZKG/
	BLnYhwK0PKK+MaP8s9JwtHlWEneKwVfnpqQgNgCgErd2Kfv20RTqFRdn2T0zpOYj
	T3ZBLYWpVHfFw3ghJ9P/6Mn4YZdWLgu9uh+xmB+2BYH+zJfcC9B+gK44k7fDxlru
	sZ8dOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8rg9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 14:10:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so10408511cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507045; x=1786111845; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=;
        b=HapVZGUn4pG6Z6lbEEzo4AInhv4z7sltCAkg34nKBTLd02grfPrpdjP++oPaTANZ0/
         o0OYiyTeehWx9c1D8+HqLlOOQXJoYyg4GVxz5ycaaXgQ7pTaTYsop8nlQsmxQ05N9krm
         9yRVieAMZfwabaW+VCP+L19s3GLtw7uDvyKvLGOZZm5ZMbKhA1phrFE8innLiGGZ07EN
         SpFy2A5a/GAz6oxIKXd1FklWV7ThesA15Jc2To0GGTcOHXnpGMhanuUblvsa1476LiJX
         CsdsxYcF2j0GwXt2ug95CO+Of9kWKmgRPni/tkW+xGyBuA9yuzDA0Xigj9uVml8aavrF
         +vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507045; x=1786111845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6MOxyNJtJk05q8LLyOUg4qa91knVI290ILuxyhKBqpk=;
        b=R5afpFeuWEXQqVueNmm91i+ttmQBgNrO1GjFwYNNSzZyW65dXwq+mOZxX57cdYcXvA
         I5MpqU1MGUi49KW+B+Rb92Cz0PABGEVnc1SqA97FaBLS7En3glWrX9w+sLXHkOOCp5Wz
         NJr4NYOrI/eN+a+NeFM7BsVxsITUEWkk3X9ZclPuNDgmzGaE1bKjlSevpxFN8XNCyyCW
         DoLP6navghGW7PDUEjOrVlca8s4Q5Qhq3MHW3rsSKX8l1bVdvUp2n8CcySzq+TES8bKl
         InVhSdTnjk1MdRs+/d6HeIAF/khiT5zESKsceS/V2uXhG7Ua36qzVwJjAk0TYI1xPaeB
         T/HQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHB2gquwhwhMfkq4j/dBFuusbr5q7VUhjJDy5EssxkqJnePa4UM7G40CwbVs/R6siIvG6xDhErb/s9cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHiAQP/N/UmRIqGJxCDZU54KVvHrEcpzRAIf+4SRGZXG7u8DLE
	F4+XjSSvTZfZdUj79Z2+exa443O9sU9ApvnzNu1kqyxdoMZazKglXTy1TwDxzzdYjWmwiA6lALK
	hHAepo44GQUENaSXDCUEcATSdoTjr97oktTb0lo0qMbHDvUS2Qn3BUcq27tUpUph9AQ==
X-Gm-Gg: AR+sD11nkWuD2TWbMi8HTj0fTXlTffHc7hKaP4tlGLMO1bAOTJrQe2gOumVpjMIN9N8
	mjQ7ay3FcQ/TCFtuPPnuVUBbES+gHnUZpR2hqfPtUOvIOiVv3d5Yxp42h7L/ikPGT2VrHXMEnZs
	J9XcULssoNX/r23o+hFqfa7NjKONOdNCzPfqj7oEZRiVQv9KTkm6hf8JIEqD5N0Vc8MriCm9EEL
	AmsBj+GBf03J7xcG8OmqiowyurqfL0WmsFort0xk21/+jtOC1vt+TKt+TkPu48JLAUwoNqxhTTr
	NfV4PG1lZvqnh5cYSK1PAgXTA+Bx7RX7jM1YVE5YebrQ44RHbxz2p2e30mHjlh7Nk+GFI8I2lbn
	TGmNHYIV7kJGXDngQ21R274UDL/HeYA0vKhtcfBHIBuEt65FMYcKNXz2ZI7HkWYpkjjtWibGtoP
	iPWnEalWGQTBYJeQ==
X-Received: by 2002:a05:622a:4c19:b0:51b:f549:c706 with SMTP id d75a77b69052e-52b566afcb6mr5479671cf.16.1785507044787;
        Fri, 31 Jul 2026 07:10:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4c19:b0:51b:f549:c706 with SMTP id d75a77b69052e-52b566afcb6mr5477991cf.16.1785507043956;
        Fri, 31 Jul 2026 07:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23d23ccsm321772e87.36.2026.07.31.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:10:42 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:10:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <lawgfdmbupi5eecyplhefyva2b4ukpsucmcz6fjfhaqrk4hokh@tp5fwmz4luca>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
 <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cace5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=zqSJYQgTpsw8YhIThLcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX7am5QIEl6Xr4
 bfzQSbFci9Ra1GyetbFipl21AIn60GDMcbZvY9v/ZbVtX51JMaMEIq0dw+wgZY5nEsIlFDihu9e
 NObt8HzFNa5gYaqXh/tN4k9A5dVE/IU=
X-Proofpoint-ORIG-GUID: p7oPmvlUFuWNvCnbtjC4NkET89GvaU_z
X-Proofpoint-GUID: p7oPmvlUFuWNvCnbtjC4NkET89GvaU_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfXyCxCUJIubfyl
 mT9Ab/ou+2yThWVRsk4rfowrMEcWTbdIc+bwENIJ4Sq2E4kOlHf89X6Mv5+qWNWTT+GdpLxGCVO
 PAcsH+NMRrHJUjeJ3VC9aBv8puVs6tkvs02ZdmeCagTLdUNOiAQ5o7ztwsmuI/fNUGjaJLtaDrF
 bFLXcydKWKDB7L27IWXjOYQzeWBj2tm1vUQ0nDdzxjN0prtn5RPjm5muUxbpTQ+yeSSlCy6mjvE
 8jStw2UaBvsOs80LyFCpRAe7v5uGBfye5iJoAeYPAdGHTfCWjCubBH7lIZ9hLYLeSTNxEU99+1j
 BKi+hhvbA5CCnWLkkiUxC/gmNyin2c5T9KZVfbNVeRmfGZccb2BmWdTdDrh1lNhYy/zXKkpwU56
 JcBa9U/55uVTWYnpOkxYbMx5mST6cRJ4fy2h3iiwJeU93zWu4v4SMdnCV+EEA7lVrILbWwjP901
 JMbUjmB8xN6rzGfs31Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310107

On Fri, Jul 31, 2026 at 06:14:15PM +0530, Vikash Garodia wrote:
> 
> On 7/31/2026 5:27 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
> > > Document the iris video accelerator used on shikra platforms by adding
> > > the qcom,shikra-iris compatible.
> > > 
> > > Although QCM2290 and shikra share the same video hardware and overall
> > > integration, their SMMU programming differs. QCM2290 exposes separate
> > > stream IDs for the video hardware and the Xtensa path, requiring two
> > > explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> > > equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> > > and Xtensa isolation requirements, such SMR masking is not applicable on
> > > QCM2290 platforms.
> > 
> > This means that there are still two different streams, one for pixel and
> > one for non-pixel data. Stop using the mask and describe them
> > separately. One will go to the pixel node, another will go to the
> > non-pixel node. As you wrote, the hardware is the same as QCM2290, which
> > has two separate streams.
> 
> AFAIU, SMR mask is an optimization to reduce the stream id configuration to
> SMMU hardware registers, separating out is _not_ recommended which again
> brings in additional register for programming the additional stream.

We will need to separate it later anyway, to handle two different IOVA
regions. So why not perform it right from the beginning?

We should not be introducing a mechanism (memory-region) which is
limited only to this platform, if all other plaforms will use something
different (subnodes).


-- 
With best wishes
Dmitry
