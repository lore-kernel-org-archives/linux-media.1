Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A239374730
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269368; cv=none; b=MTHIHVTFomr8Sbv59oH8gQdG0FByWkXg+2yQsvbk+cR45dkOVV5TXe79Xd3sg2Sq76KObkoJK9azbc0rTfD4zmErlvhFTQY2CIPwZazXfzeQY39kY9rZmLRTtrZvuU//ccEkLEKNfXvFI91qGUiVUvA1VbxBRiS67zG+8QMaP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269368; c=relaxed/simple;
	bh=f9GVrYAdT8I6cS/NXW+ByOvYdDxNzlxNUxax9t1Teyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILUUoSQ+UmuKAI0zgMqiCwVrw6j5RlEiWv2RZxxTxM9HwV7xRBE5o+PJhpl2D9E3QdtwTE2ZLnHR1C9fLkpw3ODHQu737K2gPZXIZVdoYRaC/oo5aiRd7e7AlX6FXhdpDqetx7ejS6SuaB75B6dKL5NS9z/PE0Xss8JfwBXpVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZee3h2L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHBQJO3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZee3h2L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHBQJO3t"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeQuv3754794
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nR6lMVnhMGeIaZUQysV0rl8N2gAm+xCYzcjs8G1qwY=; b=NZee3h2LFzfVTdLU
	O8LQwAQJNMie9kSTDmTj5cY2E4V1ggGD9QKiMBjjwHgkZZN64cad3xR2UVzjLYB8
	498S0zEb6MdsZWsG3ZRpfCt+JpYarO0na8ZYedC7dJcTpMr64hOyjqOl8wudMVuF
	I1sD8B2cJa3kOLjKbB7t3kMkqpyrwmwVrLTr+IwzPCK2o3QiVvSRuAt7TlY24KTg
	dcvjWpz85/vEy45K3w+oQN5Gc47W90kfvHqZETir4BYcGM/3d7G61EfEINgcoZbk
	L8HvIYAV9c8s2WH4Mh5hzZAxEA4DAaT80ztAlA2TSf+Hm9dxNg849avXXE3zJIfn
	d70wHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuku7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:02:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so95347a91.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269364; x=1790874164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nR6lMVnhMGeIaZUQysV0rl8N2gAm+xCYzcjs8G1qwY=;
        b=WHBQJO3tesJF0jvW69QN8mVrEHmeHrAY3P6Y6lKTo3sGRUUMuFU8JsMOsmHqCw05ke
         6NYhI5b1A4nphi7WhEqQYovXPA9cPO7zT8YQSXP0ro5GJ9IXecudvZIavEWuldYR3g/F
         ZJSuQ6WyAu07Rx/SzO9hfs1jSlB9VyBGO1KDxfPSS0xCYqz6FhHtjBP39smbm78mthNM
         HT6vZVlNBrykI1/rS1Mot1zGfw04o07KrvDRU+Cg70n64+GvbjH5k7GyyQQz2xgN9Sbs
         kzbZ6PmbVOrWpKDuJIe7QGLgIH/3zfDCo4bu/FKkVo3wN1/4qcF2arMUkNwbuQ10Nm48
         HLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269364; x=1790874164;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nR6lMVnhMGeIaZUQysV0rl8N2gAm+xCYzcjs8G1qwY=;
        b=aj552BTjXcLsGrc9c2QfmTp1+kC5SFdn2a92LhVzkjsWe4Hb1sIiKNNbN3GSSOHO6b
         M4bhXfLBFFqDSLt8cg5tcxGJ4HAFC6wl1Q2hYlvFwyLbTNG2zlTI93BBjWRMH22TYN8e
         RXFrDuXbzSXYBHM0eU0QnCiVXcJANO4KTXRgCbVjjs2d7Cvc12Pcu3TP2IiSNrKr3yh1
         HumAobTXAXiwOs0G2Jl29ZUSutinx5aNlHYf1VxWIzWI+/R1YxfkelWGayI+ZNJJo+yj
         u9hM8ePBWb5hZNWsn5Y9BOgFaBjsUEcPhIhVAtfFVG0HJ0LwJu8R4IEGYnh9k4CxSMRC
         7Sdg==
X-Gm-Message-State: AFuF++kHsbJULqqyizLGRIM63h1IPySmNO5JFr6w63iuqIpvv5AsBCgB
	712UayeVduNNgjao/Xxge4kQZvxC6HWv84djeG0MVSg2T3FaqprrNTovy3SydujhdWb4RVnv0v1
	/t7eV52gGy7FdzUsemUhguvdR2qpR8QLOlFX3ZxXAtmzWCRCGmJAwDNnBIbsKD1B65ugIQVwcGw
	==
X-Gm-Gg: AYBFou2kWV9kAbAQVCpBBrO2HfEhb4LM60rUGaSVxNN0yenaXJlfU5aZ3iw0MVe5hlp
	aSzep1wrU02kuneyJJ6abTJs12AK9pQrO2Tdl24NG1qe3saJvXrcwFJryvLnazWa6+zJ93o5Jt1
	cz0fGFMQ29HF5/+Ug3R0RSY63Dnw28tDevLBQYp8SfYjWAAKSSbsIhzAaIM9j/cNbPFXqInwd9k
	B/xbCy65hA/cSHrko8QgBrmQu77ikA3IErBhW3BbAj+iWSJggK2ufdwsphPDdtJv5f+xDpy7BfZ
	oH1LhwDxrfrNwi3hK0pDyln5tbyqdR1VrPr2fXppZHDW8UyabOGmHm5rJDcC7PjtrhN18Vzd5r6
	CugXpoP3ARcd0X3LLxpLgCq2B9s/Gkqo=
X-Received: by 2002:a17:90b:390e:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a0985663c0mr2858872a91.10.1790269363821;
        Thu, 24 Sep 2026 10:02:43 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a0985663c0mr2858834a91.10.1790269363184;
        Thu, 24 Sep 2026 10:02:43 -0700 (PDT)
Received: from [192.168.0.15] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b15f1sm5586553a91.2.2026.09.24.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 10:02:42 -0700 (PDT)
Message-ID: <1ee9b5a7-0bb7-660e-29be-5b61fd976ef6@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 22:32:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: venus: reduce impact of verbose firmware
 logging
Content-Language: en-US
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911-media-qcom-venus-fw-log-perf-v1-1-b8fcc69f1055@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260911-media-qcom-venus-fw-log-perf-v1-1-b8fcc69f1055@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX5aN6iRBRDfbd
 xqcJUszl7uazW2xQ9mU5Sl1pTxZICE/H04Fd17SgWns/FgBBkU1IjcF4Ny3Vut71poWboqn75MJ
 l/82NH3kXEwE+34LJiaoQtJ9qsykIS4=
X-Proofpoint-ORIG-GUID: hsTMu5GUI8m18U1ziD04rMMREhKZ63H7
X-Proofpoint-GUID: hsTMu5GUI8m18U1ziD04rMMREhKZ63H7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX1JAis7rUUVov
 hTQViCFdqxfAkNy3Lz4t/pEPKENzquBuHPHAXFse9qvdyz7WHz0bdhpgFSlGfsF0ySN4nyIKpR7
 P3bNeRaYBXUxEWKWzdtF7f+60uoaRwSFW38oi+TiwyYZqj8rqHeRVmFD4P0Vj9lXj2qunJTeed4
 ToDNG1LK9D7m2grwH5Vfxb/ZoWxrcsrIqtK4TLFQcWohiTrChAJKEUwXax0+JWeQR7XK4RNxTuv
 sk7ORuUPYcGmPyIUwYl4UxUtUqF9Uk3kLglUJt2jPGIbVI8O+Pz/Ie/LST99HweIXkCIvIJY4Xx
 gCDKsfF/j5ROEQtntPPRyXySXG6XrYearlpmRIK5IzQP93HQHy1FIs7lEXfHzuzhuhdunTBaszo
 6ulhzQdhIRLMTBE6fCJ82Rw+ReGzku9Jyxacq0FWgM9Z6XyD211uZqLqq8RKHkHS4HW5aARQ1Gs
 tTeoCQ9JDlA5IB79DzA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab557b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gsI-Rlxy7l11UutJj8YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240069

On 9/11/2026 8:17 AM, Renjiang Han wrote:
> Firmware debug logging can generate a large amount of traffic. When
> verbose firmware logging is enabled, debug queue packets can delay
> normal HFI responses enough to hit the existing response timeout.
>
> Increase the HFI response timeout, power collapse delay timeout, and
> runtime PM autosuspend delay when fw_level enables log classes beyond
> error and fatal. Restore the default values when fw_level is changed
> back to error and fatal only.
>
> Print firmware error and fatal messages with dev_err_ratelimited().
> Other firmware debug messages continue to use dev_dbg(). Bound firmware
> log printing by the packet size so messages do not need to be NUL
> terminated by firmware.
>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
> Verbose firmware logging can generate a large amount of debug queue
> traffic. When many firmware log classes are enabled, normal HFI response
> messages may be delayed behind debug packets and synchronous HFI
> commands may hit their response timeout.
>
> Reduce that impact by increasing the HFI response timeout, power
> collapse delay timeout, and runtime PM autosuspend delay when fw_level
> enables verbose firmware logs beyond the default error and fatal levels.
> Restore the default values when fw_level is changed back to error and
> fatal only.
>
> Firmware error and fatal messages are printed with
> dev_err_ratelimited(), so important firmware errors remain visible
> without enabling dynamic debug. Other firmware debug messages continue
> to use dev_dbg(). Firmware log printing is bounded by the packet size
> and no longer depends on firmware providing a NUL-terminated string.
> ---
>  drivers/media/platform/qcom/venus/core.c      |  5 +-
>  drivers/media/platform/qcom/venus/core.h      |  8 +++
>  drivers/media/platform/qcom/venus/dbgfs.c     | 51 +++++++++++++-
>  drivers/media/platform/qcom/venus/hfi.c       | 10 +--
>  drivers/media/platform/qcom/venus/hfi_venus.c | 95 ++++++++++++++++++---------
>  drivers/media/platform/qcom/venus/vdec.c      |  2 +-
>  drivers/media/platform/qcom/venus/venc.c      |  2 +-
>  7 files changed, 133 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 243e342b0ae75336af17bf630712417e34caa96b..2282926369d1e04b9a4bd990acacdf3aa344f614 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -429,6 +429,8 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	INIT_LIST_HEAD(&core->instances);
>  	mutex_init(&core->lock);
> +	core->hw_rsp_timeout = VENUS_HW_RSP_TIMEOUT_MS;
> +	core->pc_delay_timeout = VENUS_PC_DELAY_TIMEOUT_US;
>  	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>  	init_waitqueue_head(&core->sys_err_done);
>  
> @@ -545,6 +547,8 @@ static void venus_remove(struct platform_device *pdev)
>  	ret = hfi_core_deinit(core, true);
>  	WARN_ON(ret);
>  
> +	venus_dbgfs_deinit(core);
> +
>  	venus_shutdown(core);
>  	of_platform_depopulate(dev);
>  
> @@ -564,7 +568,6 @@ static void venus_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&core->pm_lock);
>  	mutex_destroy(&core->lock);
> -	venus_dbgfs_deinit(core);
>  }
>  
>  static void venus_core_shutdown(struct platform_device *pdev)
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 46705a6667762e8975e32947b4cb3355e20754d0..8a9649745fa18bcba69baf29c3ed6242fd68bd87 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -23,6 +23,10 @@
>  #define VDBGH	"VenusHigh: "
>  #define VDBGFW	"VenusFW  : "
>  
> +#define VENUS_HW_RSP_TIMEOUT_MS		1000
> +#define VENUS_AUTOSUSPEND_DELAY_MS	2000
> +#define VENUS_PC_DELAY_TIMEOUT_US	(100 * 1500)
> +
>  #define VIDC_CLKS_NUM_MAX		4
>  #define VIDC_VCODEC_CLKS_NUM_MAX	2
>  #define VIDC_RESETS_NUM_MAX		2
> @@ -169,6 +173,8 @@ struct venus_format {
>   * @state:	the state of the venus core
>   * @done:	a completion for sync HFI operations
>   * @error:	an error returned during last HFI sync operations
> + * @hw_rsp_timeout: hardware response timeout
> + * @pc_delay_timeout: power collapse delay timeout
>   * @sys_error:	an error flag that signal system error event
>   * @sys_err_done: a waitqueue to wait for system error recovery end
>   * @core_ops:	the core operations
> @@ -230,6 +236,8 @@ struct venus_core {
>  	unsigned int state;
>  	struct completion done;
>  	unsigned int error;
> +	unsigned int hw_rsp_timeout;
> +	unsigned int pc_delay_timeout;
>  	unsigned long sys_error;
>  	wait_queue_head_t sys_err_done;
>  	const struct hfi_core_ops *core_ops;
> diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
> index 726f4b730e69bc07fa925c747bfe9d7cf434b54a..4fd44b4a7e054503632e1d6f01f90e151532967b 100644
> --- a/drivers/media/platform/qcom/venus/dbgfs.c
> +++ b/drivers/media/platform/qcom/venus/dbgfs.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/debugfs.h>
>  #include <linux/fault-inject.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "core.h"
>  
> @@ -12,10 +13,58 @@
>  DECLARE_FAULT_ATTR(venus_ssr_attr);
>  #endif
>  
> +static int venus_fw_level_get(void *data, u64 *val)
> +{
> +	*val = READ_ONCE(venus_fw_debug);
> +
> +	return 0;
> +}
> +
> +static int venus_fw_level_set(void *data, u64 val)
> +{
> +	struct venus_core *core = data;
> +	bool verbose;
> +	u32 fw_debug;
> +
> +	fw_debug = (u32)val;
> +	verbose = fw_debug & ~(HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL);
> +	WRITE_ONCE(venus_fw_debug, fw_debug);
> +
> +	if (verbose) {
> +		WRITE_ONCE(core->hw_rsp_timeout, 4 * VENUS_HW_RSP_TIMEOUT_MS);
> +		WRITE_ONCE(core->pc_delay_timeout, 4 * VENUS_PC_DELAY_TIMEOUT_US);
> +
> +		if (core->dev_dec)
> +			pm_runtime_set_autosuspend_delay(core->dev_dec,
> +							 4 * VENUS_AUTOSUSPEND_DELAY_MS);
> +
> +		if (core->dev_enc)
> +			pm_runtime_set_autosuspend_delay(core->dev_enc,
> +							 4 * VENUS_AUTOSUSPEND_DELAY_MS);
> +	} else {
> +		WRITE_ONCE(core->hw_rsp_timeout, VENUS_HW_RSP_TIMEOUT_MS);
> +		WRITE_ONCE(core->pc_delay_timeout, VENUS_PC_DELAY_TIMEOUT_US);
> +
> +		if (core->dev_dec)
> +			pm_runtime_set_autosuspend_delay(core->dev_dec,
> +							 VENUS_AUTOSUSPEND_DELAY_MS);
> +
> +		if (core->dev_enc)
> +			pm_runtime_set_autosuspend_delay(core->dev_enc,
> +							 VENUS_AUTOSUSPEND_DELAY_MS);
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(venus_fw_level_fops,
> +			 venus_fw_level_get, venus_fw_level_set, "0x%08llx\n");
> +
>  void venus_dbgfs_init(struct venus_core *core)
>  {
>  	core->root = debugfs_create_dir("venus", NULL);
> -	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
> +	debugfs_create_file("fw_level", 0644, core->root, core,
> +			    &venus_fw_level_fops);
>  
>  #ifdef CONFIG_FAULT_INJECTION
>  	fault_create_debugfs_attr("fail_ssr", core->root, &venus_ssr_attr);
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index 675e6fd1e9fae40177349c0bc68f38c326b9aa25..615f30d86c7bd86087ef274d2cfdbc5dd74baee9 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -15,8 +15,6 @@
>  #include "hfi_cmds.h"
>  #include "hfi_venus.h"
>  
> -#define TIMEOUT		msecs_to_jiffies(1000)
> -
>  static u32 to_codec_type(u32 pixfmt)
>  {
>  	switch (pixfmt) {
> @@ -49,6 +47,7 @@ static u32 to_codec_type(u32 pixfmt)
>  
>  int hfi_core_init(struct venus_core *core)
>  {
> +	unsigned int timeout;
>  	int ret = 0;
>  
>  	mutex_lock(&core->lock);
> @@ -62,7 +61,8 @@ int hfi_core_init(struct venus_core *core)
>  	if (ret)
>  		goto unlock;
>  
> -	ret = wait_for_completion_timeout(&core->done, TIMEOUT);
> +	timeout = READ_ONCE(core->hw_rsp_timeout);
> +	ret = wait_for_completion_timeout(&core->done, msecs_to_jiffies(timeout));
>  	if (!ret) {
>  		ret = -ETIMEDOUT;
>  		goto unlock;
> @@ -140,9 +140,11 @@ int hfi_core_trigger_ssr(struct venus_core *core, u32 type)
>  
>  static int wait_session_msg(struct venus_inst *inst)
>  {
> +	unsigned int timeout;
>  	int ret;
>  
> -	ret = wait_for_completion_timeout(&inst->done, TIMEOUT);
> +	timeout = READ_ONCE(inst->core->hw_rsp_timeout);
> +	ret = wait_for_completion_timeout(&inst->done, msecs_to_jiffies(timeout));
>  	if (!ret)
>  		return -ETIMEDOUT;
>  
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index bd82066bb6e77f68ac3fe1440a8b5429ad62a192..10cf9a775d8bf3781150c830583db4b190146be2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -132,7 +132,6 @@ struct venus_hfi_device {
>  static bool venus_pkt_debug;
>  int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
>  static bool venus_fw_low_power_mode = true;
> -static int venus_hw_rsp_timeout = 1000;
>  static bool venus_fw_coverage;
>  
>  static void venus_set_state(struct venus_hfi_device *hdev,
> @@ -949,7 +948,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
>  	const struct venus_resources *res = hdev->core->res;
>  	int ret;
>  
> -	ret = venus_sys_set_debug(hdev, venus_fw_debug);
> +	ret = venus_sys_set_debug(hdev, READ_ONCE(venus_fw_debug));
>  	if (ret)
>  		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);
>  
> @@ -985,29 +984,52 @@ static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type, bool sync)
>  	return venus_iface_cmdq_write(hdev, &pkt, sync);
>  }
>  
> -static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
> +static int venus_flush_debug_queue(struct venus_hfi_device *hdev)
>  {
>  	struct device *dev = hdev->core->dev;
>  	void *packet = hdev->dbg_buf;
> +	int num_pkts = 0;
>  
>  	while (!venus_iface_dbgq_read(hdev, packet)) {
>  		struct hfi_msg_sys_coverage_pkt *pkt = packet;
>  
> +		num_pkts++;
> +
> +		if (pkt->hdr.size <= sizeof(pkt->hdr))
> +			continue;
> +
> +		if (pkt->hdr.size > IFACEQ_VAR_HUGE_PKT_SIZE)
> +			continue;
> +
>  		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
> -			struct hfi_msg_sys_debug_pkt *pkt = packet;
> +			struct hfi_msg_sys_debug_pkt *dbg_pkt = packet;
> +			u32 msg_size;
> +
> +			if (pkt->hdr.size <= sizeof(*dbg_pkt))
> +				continue;
>  
> -			dev_dbg(dev, VDBGFW "%s", pkt->msg_data);
> +			msg_size = min_t(u32, pkt->hdr.size - sizeof(*dbg_pkt), dbg_pkt->msg_size);
> +
> +			if (dbg_pkt->msg_type & (HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL))
> +				dev_err_ratelimited(dev, VDBGFW "%.*s",
> +						    (int)msg_size, dbg_pkt->msg_data);
> +			else
> +				dev_dbg(dev, VDBGFW "%.*s", (int)msg_size, dbg_pkt->msg_data);
>  		}
>  	}
> +
> +	return num_pkts;
>  }
>  
>  static int venus_prepare_power_collapse(struct venus_hfi_device *hdev,
>  					bool wait)
>  {
> -	unsigned long timeout = msecs_to_jiffies(venus_hw_rsp_timeout);
>  	struct hfi_sys_pc_prep_pkt pkt;
> +	unsigned long timeout;
>  	int ret;
>  
> +	timeout = msecs_to_jiffies(READ_ONCE(hdev->core->hw_rsp_timeout));
> +
>  	init_completion(&hdev->pwr_collapse_prep);
>  
>  	pkt_sys_pc_prep(&pkt);
> @@ -1091,6 +1113,8 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
>  {
>  	struct venus_hfi_device *hdev = to_hfi_priv(core);
>  	const struct venus_resources *res;
> +	int num_debug_pkts;
> +	int num_msg_pkts;
>  	void *pkt;
>  	u32 msg_ret;
>  
> @@ -1100,31 +1124,35 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
>  	res = hdev->core->res;
>  	pkt = hdev->pkt_buf;
>  
> -
> -	while (!venus_iface_msgq_read(hdev, pkt)) {
> -		msg_ret = hfi_process_msg_packet(core, pkt);
> -		switch (msg_ret) {
> -		case HFI_MSG_EVENT_NOTIFY:
> -			venus_process_msg_sys_error(hdev, pkt);
> -			break;
> -		case HFI_MSG_SYS_INIT:
> -			venus_hfi_core_set_resource(core, res->vmem_id,
> -						    res->vmem_size,
> -						    res->vmem_addr,
> -						    hdev);
> -			break;
> -		case HFI_MSG_SYS_RELEASE_RESOURCE:
> -			complete(&hdev->release_resource);
> -			break;
> -		case HFI_MSG_SYS_PC_PREP:
> -			complete(&hdev->pwr_collapse_prep);
> -			break;
> -		default:
> -			break;
> +	do {
> +		num_msg_pkts = 0;
> +
> +		while (!venus_iface_msgq_read(hdev, pkt)) {
> +			msg_ret = hfi_process_msg_packet(core, pkt);
> +			num_msg_pkts++;
> +			switch (msg_ret) {
> +			case HFI_MSG_EVENT_NOTIFY:
> +				venus_process_msg_sys_error(hdev, pkt);
> +				break;
> +			case HFI_MSG_SYS_INIT:
> +				venus_hfi_core_set_resource(core, res->vmem_id,
> +							    res->vmem_size,
> +							    res->vmem_addr,
> +							    hdev);
> +				break;
> +			case HFI_MSG_SYS_RELEASE_RESOURCE:
> +				complete(&hdev->release_resource);
> +				break;
> +			case HFI_MSG_SYS_PC_PREP:
> +				complete(&hdev->pwr_collapse_prep);
> +				break;
> +			default:
> +				break;
> +			}
>  		}
> -	}
>  
> -	venus_flush_debug_queue(hdev);
> +		num_debug_pkts = venus_flush_debug_queue(hdev);
> +	} while (num_msg_pkts || num_debug_pkts);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1227,7 +1255,7 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
>  	struct hfi_session_init_pkt pkt;
>  	int ret;
>  
> -	ret = venus_sys_set_debug(hdev, venus_fw_debug);
> +	ret = venus_sys_set_debug(hdev, READ_ONCE(venus_fw_debug));
>  	if (ret)
>  		goto err;
>  
> @@ -1584,6 +1612,7 @@ static int venus_suspend_3xx(struct venus_core *core)
>  	struct venus_hfi_device *hdev = to_hfi_priv(core);
>  	struct device *dev = core->dev;
>  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> +	unsigned int pc_delay_timeout;
>  	u32 ctrl_status;
>  	bool val;
>  	int ret;
> @@ -1612,8 +1641,10 @@ static int venus_suspend_3xx(struct venus_core *core)
>  	 * 2. Send a command to prepare for power collapse.
>  	 * 3. Check for WFI and PC_READY bits.
>  	 */
> +	pc_delay_timeout = READ_ONCE(core->pc_delay_timeout);
> +
>  	ret = readx_poll_timeout(venus_cpu_and_video_core_idle, hdev, val, val,
> -				 1500, 100 * 1500);
> +				 1500, pc_delay_timeout);
>  	if (ret) {
>  		dev_err(dev, "wait for cpu and video core idle fail (%d)\n", ret);
>  		return ret;
> @@ -1626,7 +1657,7 @@ static int venus_suspend_3xx(struct venus_core *core)
>  	}
>  
>  	ret = readx_poll_timeout(venus_cpu_idle_and_pc_ready, hdev, val, val,
> -				 1500, 100 * 1500);
> +				 1500, pc_delay_timeout);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6a43ea191da15fdfdbbf0a136b11ef85bcc7a73d..cb74318c6408f49354a75b768008e2edf2a347c3 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1817,7 +1817,7 @@ static int vdec_probe(struct platform_device *pdev)
>  	core->dev_dec = dev;
>  
>  	video_set_drvdata(vdev, core);
> -	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_set_autosuspend_delay(dev, VENUS_AUTOSUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 79acf7c1ec9a3a1b36f1a5e83af1f6c330802f08..e0350e6db45e72d47536b7539deca2f728393bea 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1593,7 +1593,7 @@ static int venc_probe(struct platform_device *pdev)
>  	core->dev_enc = dev;
>  
>  	video_set_drvdata(vdev, core);
> -	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_set_autosuspend_delay(dev, VENUS_AUTOSUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

