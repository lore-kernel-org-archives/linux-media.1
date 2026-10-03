Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB83815E6
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066500; cv=none; b=I+3dSQ999wXSSXt2xo6/poXDx1NXOL6RCjAQEPX2l5hV3DN87YIv9P/xwwjCvOoHzUgqU+HnAeNmsbVhg8S6K0GUG08z7xACpYvQmNKVbV7BJXDZtJXHF+vDgInFXGlWH3jJmHu20IjOeZ0HUlQ7kIFmDgldvO9w3OuZPKSapDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066500; c=relaxed/simple;
	bh=k3pu6UlAByUAsZ1COmnVfKb/1csTnqbAuf3uXtysK5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARE5MxJ1nahV9TCrHolCmZ1PpfH/URnEBtUObyRKkMCCXp0gaecS3A21OB2FrjMFMHDAx8vZ76trsUVI15ggzwG04HJ+t34DZk1+/xgvMjp2UVrP6DM98sYNXKP+ZX+lqlX45NeBdyf04VtQ8E6SrzpscAiNg/du7NDDYyoQZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9jv6JFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdpuPUVd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9jv6JFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdpuPUVd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Kolc21305861
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 22:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=; b=X9jv6JFagqgG8Tcm
	cDdbDven0/uCifZa8j7QD1JtjMcJYKAzhsxd58xn38MCtnLMh8NLXuC+7G7khy1A
	dDNoJjCdifUhuBxBPpWYaBPqkYMSW8Y6ARMxV3vrWsPbOiiUNqxYPE5+QIItnE9m
	LwtjbgBHqt0pfVovtQTytiDTJ32ub8ahfd5eRij5iFdDo7KWTgtfE36M7U55FCn0
	d5eMda3pudCqbFHS7goAIC9oD3v6MH+hXg0cKzz6n0iz+xCoEoa2EmDijpxkB5lL
	Ru8mxmacAaQnO8P0qwavAWCbHzj8MAgyX8b4bIFjsgnG8F20v5uT2KnTbE7epFcN
	nPMBTg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx31whc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 22:28:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso394476241.3
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 15:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791066496; x=1791671296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=;
        b=ZdpuPUVdDtYWnsOvvQ4H29agyUBkOMijobo1zxxYdBqlDBxrMLLQOCaoK4tBgbp2rd
         OGGAghkiuIgc3iYUDbztf1dtG9/8o4YcSQ3er15DPi1hrou2XyJysk3QrnKy8iKMbIqX
         gn5UYJbGFJknzSLoT6vS1NkUtag2M65oUIj513fKDae54IDxI5HBUflHLeNddHBMoQAB
         YxXyWyjJfXybdTXezLpJVpYVnuIrOZxyyAqicNKxRLalxAbP3apbo8fZWPn1ORRLWa+C
         YfgHBdDoHT0f+d/cajWh0HCykjoKXRc3Vm86yoAldRvdIjE2fl2BQfr9QUfhDmP2fP1c
         nDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066496; x=1791671296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=;
        b=oQ+sbDFRIp/Qp5X5nS5fA2OnWcRPwr7TY21EH2w9QcLbL0GjcP2h3AOLqdeg+qnfgJ
         FaZeiSleXRlCAZMpSzdW8ekwO8V8gv4ngZUDx8K1pYGObR52z3D9s/S7au79qOHWOg6b
         alqn3F65e+o6ijUUdbQBnBoMRCkR9QAIW/SDPZHF0eVvQZhLmhKd9i9w2CUXkaAx6XB9
         gCpIMFiKXUelmfiAv1eWuDB18Pq+fWrFDvIbpiJWHOEjrZbIUzEx9pzOyhccrob0xJlS
         g/2sDWEsyAJSoA2FqjAOCToncoD2Ztq0gEWRETpVt7NHHOx0jUHnsWp9z+dkVsTx6o09
         mG6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8iLLe0cC1SyHQKncbWc6tPktR1SSokCl2AcpnpOu6RrTcAve8Lw0vum5y/JVvp13gj/k1Plt/0LlYYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ap1H7tyVNRE5cmI+jxtDC+tnFpal8KAvl4FVZq5zlTY7B4jc
	xlH+IrEIv64/elXe7+sjvMXstn5xvnyoGj/ucq5JcEdaBFP7w5Zfy91E+VrjN8cMTWgJeyvthps
	TuFJaINGYyQ0IXGXu3RnzsPtbeebn8DaHCpn2sDHxKZQU0lGK5tiT3vW2/a8YG8yxDQ==
X-Gm-Gg: AYBFou3wgFWpaJ9S06uSjTlYLXQM1PCBCHbGC5Sn9LR6RM3/N6gzrKE4Nb+/ohPW43+
	T1V7PCewL5MZfQuGACSibwQ8+J8UHSqxIBDgnoWSrzoRTsH5rAODHnU0L8lbS8mKlwGjAp3aT3F
	UfqmI3r+fdx8qLNg7kVCHPZpUwLv6cqc0BnA7N5B9cHKo1PWd/HiTMsYsRTOaRLoHeFaKyJDVk3
	AgvuUymVL5h1yZ2zTLQBtmtZR6pL+8+AubG5CI2QCf3YrQntJOLKSngpYV+42oNyKlCIAZQJI4q
	f9yOW5/+Ab+68sJ68hao+Tn3IFAADxF8wvz1VvObWD5IMYeqMs2K3H5jRfEU1xJUs8CA5gJ0dKw
	jG+BMbrxakqzUSdlIu9yCFgV0LVllOiy/7wBvBpJb/mGZe4rOrwiRuzTbuxnSTH8MHmp3z9A1Fz
	FACBmGQElT09KB
X-Received: by 2002:a05:6102:148c:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7c0f3d4ba11mr2024903137.12.1791066496102;
        Sat, 03 Oct 2026 15:28:16 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7c0f3d4ba11mr2024897137.12.1791066495559;
        Sat, 03 Oct 2026 15:28:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a966c4d821sm20369441fa.17.2026.10.03.15.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:28:13 -0700 (PDT)
Date: Sun, 4 Oct 2026 01:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
Message-ID: <zttltt3f5zmajyy2fbhod5vc7x4l7l6htcalu5hpbrpmd2kgze@p675hgd5pwko>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
 <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
 <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
 <1eeccb79-540f-4a84-987c-77dc2b05fd18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1eeccb79-540f-4a84-987c-77dc2b05fd18@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac18181 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aLSecQpocWsgUSzuDAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 4MV1vPLU6CTjGDCL_l8CS45WT-NAvLwh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfXzDc+DReStQNR
 uVek8XliFRaG0jIvQ1TFXjS4X3JnopHT6E/rAvSZPu6hQBUPfsgCl5F1bdmTlUHWvlscm+dlBm5
 lSIMZa82mFfdwIEMUXp8lVhOH12oXZs=
X-Proofpoint-GUID: 4MV1vPLU6CTjGDCL_l8CS45WT-NAvLwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX9pNJTlVBEUpr
 R6a2U4UPTPUK2wrWCVT5x+QKzrcN3HGBRNuL0CknBaFAmL/oB65hqX4ut9mipP+2HTn3AYzg1Fe
 wAaHG6WDIyY592ig6OWFzaIg0n9lr0opIP10+ang5AI1QA8SrSItalJAXt59ClBJx9Gldav/Q0J
 9yZDFoAKRETsJzvUHsvI5lznXcCIQ/CbvRYlBkXM2HEjXeVqlt/TU96c7fw0LLdMANEwkfgg7Qz
 RHM1KanSJOah+l6t89PGozeMb4e/uO4TiTPklIvBEkjsasmoeH/9/tBqnJZyZRjGhEf4ndlt/RQ
 Ox/j5WCwWDl1AWJZpmaySguVpmXM/qz41hbw6Wt20zOcVilfwQkH4SBILrzwJSxvLv+BFqMgVnS
 of2OZ3h7Ab6M+kQU2KF227ZuAqXOWfIczitWyri8OrYeTgrL7Ul52Q6rAZ/EozOfwzZdtshVr1J
 VIFDY+plfs2B1rZy07w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030089

On Tue, Sep 29, 2026 at 09:37:38PM +0530, Sachin Kumar Garg wrote:
> 
> 
> On 9/29/2026 8:35 PM, Dmitry Baryshkov wrote:
> > On Tue, 29 Sept 2026 at 14:54, Sachin Kumar Garg
> > <sachin.garg@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > 
> > > On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
> > > > On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> > > > > Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> > > > > exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> > > > > HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> > > > > is only meaningful for CBR rate-control modes.
> > > > > 
> > > > > Low VBV delay values (34-100 ms) require the encoder to run
> > > > > with a single video pipe, so extend iris_set_pipe() to force
> > > > > work_route to 1 whenever the configured VBV_DELAY falls in that
> > > > > range.
> > > > > 
> > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
> > > > >    drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
> > > > >    drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
> > > > >    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> > > > >    .../platform/qcom/iris/iris_platform_common.h      |  1 +
> > > > >    5 files changed, 50 insertions(+), 2 deletions(-)
> > > > > 
> > > > > @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> > > > >    int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> > > > >    {
> > > > >       const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> > > > > -    u32 work_route = inst->fw_caps[PIPE].value;
> > > > > +    u32 work_route = inst->fw_caps[PIPE].max;
> > > > 
> > > > Why is being set to the max value instead of using the .value?
> > > > 
> > > 
> > > fw_caps[PIPE].min/.max/.value are all seeded from the same platform
> > > constant (num_vpp_pipe) at init, so .max and .value were interchangeable
> > > before this patch. This patch now writes the applied pipe count back
> > > into .value (used elsewhere for power/cycle estimation), which makes
> > > .value stateful. Since iris_set_pipe() is re-invoked on every resolution
> > > change while streaming, seeding work_route from .value would let a
> > > previous single-pipe override persist as the new baseline on the next
> > > call, even after the VBV-delay/CBR condition no longer applies. Reading
> > > from .max instead keeps the default pipe count stable and re-evaluates
> > > the workaround fresh on every call.
> > 
> > With the .value being written, does it need a lock protection?
> > 
> No — inst->lock already serializes this. iris_set_pipe()'s write to
> fw_caps[PIPE].value only happens inside start_streaming
> (iris_venc/vdec_streamon_output(), both the iris_set_properties() cap loop
> and the DRC re-apply path), and start_streaming takes inst->lock before
> reaching either. The only reader outside that same call chain is the
> power/clock-scaling code (iris_vpu3x_vpu4x_calculate_frequency()), which is
> only invoked via iris_scale_power(), itself called from start_streaming and
> buf_queue — both of which also hold inst->lock. So writer and readers
> already can't run concurrently; adding a lock here would just be redundant
> with the existing vb2-op locking, and no other .set() callback in this file
> takes one either.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
