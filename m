Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEA409271
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013598; cv=none; b=H+rZ6wM4hVmDekfItQE6YFfDE5cybrAvMS69rZnyopuA4b45Ba/OTGgFE0XqBpqMtm21Dmj5+2ywxtxfenEvgisCa2k7baGcrvNxIY5AzYAwFwNGJtT2zMQ5hL4pR8twKPHcSag5uksTDw4CBLVWOgqldDhk/H2ZLWWG3c37kuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013598; c=relaxed/simple;
	bh=6kfvxPMvARACXuMOizxaC6XrksJkpRHPy9i92fK8whA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2WWKSImWX0kFmG679P21NETcVoisDegai4xgcwXiTxKTtjE5WHMHbycarAYraz7EsqVaWO5wg3fDVX47kZs+dUZquohUzIDJFU5uvPUW+mQyuIB1BXhDjhmdveOjXvtfaFv976yDLu3OiRRbuQguX7wh5izB8U4cEm/FFc9boA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1FJg1vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqGh2i8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1FJg1vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqGh2i8m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769oGhg2106070
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 10:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6LhErayeVS9Tw5uX7z8/pZd
	oGU0JEh0a52vMwvH3+8=; b=K1FJg1vpgk5g/wO2pXWL7xkBjcNgRPCmNliyEDk7
	Vd8hdhvoS5oeko/9Dcg4A8GouS82qfUiVZEoPR111YRBHlBZEWdyzVEdWFWrNmW6
	+EIEikduia1hS8XCk3BwB+5lIxn99RIj3z99ZMfXifhAIqlwwoOATDUxn+SE/Kbw
	dOA/YHb7f9xRRToIjTNtdJvKe+2DbFfI/GLaqucUEMoBSPIfMsdr6Rz3kwjcMeug
	E+puXeTFrN9sFVGsXBBdHgaNJ5bL0X4+CftJ8vlWMufajroIWBk5OxQdoV1JfB5P
	JxQBz7SjXHBGCp1CP5nP+U7EfsehRX30dw233QblnRBO3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730fgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 10:53:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so21204951cf.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013595; x=1786618395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6LhErayeVS9Tw5uX7z8/pZdoGU0JEh0a52vMwvH3+8=;
        b=bqGh2i8mK+gO9pTAFZLuKPT2eqxeLS2JNT1ZhXoRgoMU5wJxtaKCWGio8IRSv2S/s9
         bjU+OoDj+KWQTY2/SJpJYVI0JHPITiqWECKrHGUtUVXHQj539A5qGFGBK7FVuNvCCB2k
         2+clbumuzstzvEZwYpCVRiFMwd0i7vbAIOKURhYhnv7Da8ZOyYUOlS9z5+e8+a7l5rD9
         110Ldn+iaBl6z3XQ6C4tZXOFIBVii8o3WiEe2AxeTK1GBjeU7zS27aLxuSUevc1QCy+q
         IUO2qEDqCuNwvV0i+lvOeliIeTYwbaecdso2X1VPL2LJOtFtiFEr/WlB/kcbqRMNO7rw
         nHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013595; x=1786618395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6LhErayeVS9Tw5uX7z8/pZdoGU0JEh0a52vMwvH3+8=;
        b=K3l5JiQaMAAd+5VFkNGeiwlGd+k2roJNOf3KkKVh1701HwPEu1f8SMi3eItwG245IV
         ZhRJRI8YMqy3ECUaJYJvbXMfAF63u52e7sAHSCKVNXOsITkozFNbGqhzbiYfjb8pzNpT
         J5fJjcsHnfwrHs8ps5PxR6OV6LE1hqbPaotQdfsgt+dwQmGv6u8vo4e56osLCNFn6App
         1aV2qU17WEQM1OLgeG7aJ4Z7y/AmGIKhYQ70Ahs61xJixcSiiG0Wj+Qi0bgCXpPBv8Kr
         AbawLhsGrNTWVwwDFZRp5xx6aiVldNs4vjgn9tXVOAy/YV+W2aM/n/2X7ioGxHIZdChe
         qdMw==
X-Forwarded-Encrypted: i=1; AHgh+RpT7BWIta8EHjFmvnzRF4gQ+PrJRxyiKajRS89bHlZCduqo6q6ACMU4VO2l1QVJq9JeDPdtg8v91JQB8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9A4QPA75H6re0lbjKER0T1iUdfh4Si3C1+ey3EOm7GJdv8loC
	LoPYU38ib1vWxrZcV9TtITHzKnSIZ5+wr+nv8KKW3TsXBCxNa7XNtx+jTYUyQrjRzwSEmrIEisr
	t9oSFdKIX2h2YvU24CyYmBTmsJ6qX+ioy94FwDKbvWCD4eb0SnE3cGLdprylXMjmjMw==
X-Gm-Gg: AR+sD11zMnd2xF37J1lOseAL2vuS5K1NBhHlV+8vkaWY5s/+QsyZgGGsKZxYksoE5BZ
	7ht+Lb/TsffYjK8KjNhYTJFsM6NNzPGn4hSekp/UDSeKYh7AtIoUdJ6zq6CSZ9Dvy4jVhS6HBUf
	/eFUPVI7p9TOsVF6I3lJuffFc1m5Km3zITb6wwx97xAjN7zQTQTldWsrgDrpigUcHiwUUlpIO3R
	OBWczYLA96eWOcuN5aTvykU79F2/ej4IQJxnKpGrSU9HihqULZW4VLMX9LcZQ0CpVRmy/GOYjIW
	wwNS31rQRmtIqoCX/g6T2dz+h/13V/OpQVopfAkxsA/1d+ke2GXmgxI2FefnIGIog18Lffbjyg8
	Vr5gaTZUZtZZZoy/F7lR3KZC8/iOOc+DDxIqCsaEytNZaw/TjnLIAWEf7EieAm+hhJCp3Lv96ZB
	MPy70YawZxRjuC6Q==
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr143925011cf.32.1786013595310;
        Thu, 06 Aug 2026 03:53:15 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr143924621cf.32.1786013594890;
        Thu, 06 Aug 2026 03:53:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62ba125sm628611e87.57.2026.08.06.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:53:13 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:53:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 07/12] media: iris: Create pixel and non-pixel context
 banks on VPU3x
Message-ID: <ivbpgz2kslg2es3g6y73ubiv2sxihcmqqwwcgsckgo7zxkq4ej@btb7onbtpsu7>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
 <4lhoiiuaiathwqscyvm2ruqfqnz2bzjbfe7s7tqbcxfcqphjas@u7vvrj2scxi4>
 <639adb25-2495-476e-9b8d-d07d34c12895@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <639adb25-2495-476e-9b8d-d07d34c12895@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfXzHY8CtuTXAkp
 2eTc3TllHOvRqn0K4eiXDmn9PTelK4R9hPDKNzt9/mmWLmyX4k5V0wCP5Hd6TSPttWys1Eupx1w
 UIxelPqGBjvXi5U9rOcXjO95DrUTgTI91DvrCfif3SnWJxu2MmBrhQbBx28UrpRK5rnSwVZ5lK2
 U6kAq/tarTLKiDrO61HhdDERXQyqho72PL7ZvnzzBs0TAi35EPDev7v2bD/SKSp5iC9ADBGS2Lx
 bwbQAD2cJV22UeCoWBvlCA2fRz6snXEf58BV2qOB4OeVvxwFwO8tVXhs8yoIwhLMQbXBIt6rM05
 U4/CwLmpEAwkjpn8FsXRKivWmvfATOdV1HC4HhAZ3S35gikOWrxkSN6x2yYs6EUmO9oeq/JAsCW
 FzYGKavkhaYlcdsHYCLXQz+IZrfJSB1FXFKSiijuRclUhlVGjA5BnO2p6e+C7xSZvdblFBY60Ik
 pC2UCqzoX757IZSX+9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfXx0+T2YYFkROT
 9vu6t/FfRhvEF3Pvwu2ufq3zHTpgvpGr88XomtbhCvMUSkjjOdwNPMzMFR16a2SVoKxuP9dOrAp
 fpw5YJZcmVpy+BllE8n9p9Lee6172CE=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a74679c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=PHneWq3mTtEDJPo0Y0MA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4QwXuGd6IxOvVSaIZZGsUQrLe5ZDpWjQ
X-Proofpoint-GUID: 4QwXuGd6IxOvVSaIZZGsUQrLe5ZDpWjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060085

On Thu, Aug 06, 2026 at 03:36:14PM +0530, Vikash Garodia wrote:
> 
> On 8/6/2026 2:37 PM, Dmitry Baryshkov wrote:
> > On Fri, Jul 31, 2026 at 11:52:22PM +0530, Vikash Garodia wrote:
> > > The VPU issues DMA through several SMMU streams, and the hardware does
> > > not give every stream the same addressable range. The non-pixel stream
> > > is restricted to use 0-600MB of IOVA space, while the pixel stream can
> > > address the full range.
> > > 
> > > Implement the context bank hooks for VPU3x. iris_vpu3x_init_cb_devs()
> > > creates the "non-pixel" and "pixel" devices from the matching device tree
> > > subnodes, and iris_vpu3x_deinit_cb_devs() unregisters them. If creating
> > > the pixel device fails, the non-pixel device is unregistered and its
> > > pointer cleared before the error is returned.
> > > 
> > > Wire the hooks into iris_vpu3_ops and iris_vpu33_ops, which cover the
> > > platforms whose device trees are converted to context bank subnodes.
> > > iris_vpu35_ops is left unchanged, as sm8750 still describes its streams
> > > with "iommus" on the parent node, and the fallback in iris_get_cb_dev()
> > > keeps it working until its device tree is converted.
> > > 
> > > Backports are intended since the first DTS of 8550 binding schema.
> > > 
> > > Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> > 
> > Drop
> 
> how do we backport these to the prior kernels ?

Point out a corresponding patch, which introduced the issue. I guess, it
is one of patches, adding Iris driver.


-- 
With best wishes
Dmitry
