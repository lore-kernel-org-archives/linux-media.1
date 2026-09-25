Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323E1F942
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296445; cv=none; b=HW0cDQMNMMD4C41aMyRdfotdXf4KrgcO+wSGpkYdz5alv6Lwv2sNtCVkuDLYJEs+QoUMxPb5N7aItkZSdIQCw4EEuY0HT/9meY5HRpp4HVhgtAWAGgw+lAuPqsdwHu4188vdGPk5yYTeD0+mD3QGEOQwvFdOQnOfImjclr44YNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296445; c=relaxed/simple;
	bh=bJG76MU0jqd2UZEmSn8HJqzFyqm6bydpj0awsCLFloo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSfmOBkeJldZan6G5i7wEaeDoBzCDVi+4S1CIEwFQhrEkmZqF9Q/JL0yhN4EqLe3sPxDdPOVaCBYgmNu5P+GIJ4vENGfPlc9vaHTFf8YwzKqz0Iz2uqlwqfd52q3heutdnNX8MpdF5ipueLhi1jII/UVqAr0okOVV+x6xIcw074=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omhbL0YJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOx6d3hz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omhbL0YJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOx6d3hz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP2gm3627842
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=; b=omhbL0YJk/Cf7HyQ
	xygW4lOpvfXBnNbMajX3GbmgmNUqkpxMBwefcjmlZhPRoM8XZlK54Dy70Ne/R1qJ
	UPJnNgMxPl+iM/tU6QiSkqyBqngPL9aHEU7S3Ev/5yGQ/rnPu5qP02DK88wnEkFn
	YNCINJehJBZvzF25sTrfFwdX9FjV4l3vdez7ckglXvfhLQUWJVfahuLF+1I2UppL
	C98zUdRjTgx8ANUrQEJXf/CqkuqWnfxlY7lE6PXI/kk34nQOsoTzqgBcjd9QoAJq
	sT8zynSjVwMElxcwE/cYjevG2vAosqUj6w2bE+OGNct0+XgYz40KbZQcwmeChLS+
	EHIdNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898sdtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:34:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c58d35c0aso69589eec.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296441; x=1790901241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=;
        b=TOx6d3hzREJSbhD+U07gF+H/32qhoII2dGsTNZAv+/2bygOsb15mMaHx3eMJhZbTRs
         A3oFm/Jw+zMYRkdN522cYtKGU/qn34kgbmc+lcUihGNPXpnKfY5+NXXG415rLz5ufzHl
         aq4xoxXxefAOmOJkuk9nmUYb1G3zNE6p0yWp1qiseTsTiVXX6pKUbaHrp7uVU72rfIAU
         bRwhd21ymtsW1zmtLmgCZN9dHxiqbCOj9rF1bw39Fi46QBo5mX1j+xSjr+ZjrqIsVtrW
         +tr9o4KyiJn1eYHp7ESzxhKOazwaG/7PO1/vXM5IwxX7G4JNaxff4rtK0zh191Kdfe2S
         ixHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296441; x=1790901241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=;
        b=V4UsJFo+B+o828hZPWAF4Kb11aEuFxWOyMNszYbsHRbSAqh8TbfXZdBb+vkHbg77xc
         CfOdQi+9vZbpNMhXUW3JqOt0x9GRG7vUSRr71VKUmphN0nDJPkYYv+bJwRPX2htfSK6u
         yEOXBg9wGxfr1yxu+YjOypf7wpXm1DquoRcjDeK6ZcaL+BukuSdbveqXc/GHJj6FgO1F
         zCepShNauNhwJ3BskTRwvlEXOJ+JHVWez5fzoc5EeV9HcQjB7VT8mJ7PnN6jZVjqg51j
         f31Dj61RCSd0J7Q+QPIUwBMT/tMVPYGWmUpU7rVACeaooFubmU/g/OaKtISLu/uFjdCt
         /SEw==
X-Gm-Message-State: AFuF++mVi21SqGnhjxw4iGkZXJY31CjwX4Dd7OIl9EGpLNt5ll2O1P+M
	j+YBewtUzdz3DiNCc5TaSKPqqMMCBrSHUswfjyF8jpnulgEqgJk9pptnAXJV1gaSaAOqeXPELtA
	Ao7s9ThKh/o6PLHbmL8C7iaLkajbR4pjzsMSLJa9pPEpOd/qNuAyPhB5tyo7bAXHf/w==
X-Gm-Gg: AYBFou2hzBJbbLmnDQTs92I11eprUL5y46K8rjPGMMf7n0o9bjCV9E3v3eagLUy95by
	GOGr6vURacCqm+766KqE5fC0/jh5666DftnJGsCiHQIH/HIkYlNvgCuER/CK9346UWrGzxQ5K0V
	sZFDQ/WX5u1XojrL1pJZYxxp0HDwvwPaVtZTL0ZANynJQ+NP/NHjjhzZEYnmZkk6pxMFs2BK1eP
	T+4eZ72ZpbMfbkCaj0wUt1HpW3vMyJGnYE6pRitYIAKdJ4tWlOXoatQB1H4aMTHQjPz+6hcV2ar
	kzPBTGdv7H9rCufESVpyUNxRqob7CnOFKTPbHX/Nj8UbqVISgiJPxk+46SSQXfTgrxXeOBK9QsJ
	uAiA2VyI6ooDWH2XWM6J1ZiFhoUZuMR+wOP70ZHVL6iEZQyzdrWAkvO/Qw/dS
X-Received: by 2002:a05:693c:87d5:10b0:33b:ee8a:2061 with SMTP id 5a478bee46e88-34005f6863dmr5006331eec.1.1790296440391;
        Thu, 24 Sep 2026 17:34:00 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:33b:ee8a:2061 with SMTP id 5a478bee46e88-34005f6863dmr5006295eec.1.1790296439654;
        Thu, 24 Sep 2026 17:33:59 -0700 (PDT)
Received: from [10.110.16.27] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm1839383eec.28.2026.09.24.17.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:33:59 -0700 (PDT)
Message-ID: <a2baeca1-29e7-4627-8fd6-b2696ce5d11a@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:33:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
 <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
 <38a64473-87cb-4dcd-b5dc-24550f4d24af@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <38a64473-87cb-4dcd-b5dc-24550f4d24af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX+NS06WeMp+TH
 IOKIrQKk/hQ6MITUCSZDR+SXgo8NHEr1Llildy5yXwCC0YXcvHgzXMGGBUc2jwVurEmqunF0Xbi
 3FvDibjuQxk75T4667/M1ALNO7QSJIYgUWFnTvz2F6Ogg4MeAuiuijXIpVGXmVt0Bm/Ohq/LJ6a
 Zzqm6/L8Fc5ZgyKUUTVWNHakh4e3YSe/iBoZfhUHFYx9B8h2sE2AScAqgYeZcA//1YU0+ZjQHj9
 IdmrnHKf2iwhY/VTLnlKQPlSHMWp3hInimqMUdUMwm0D5s/dTIdgTp1Ho51TP8t/JTsoIlSuNAi
 2QdxSbRP8Wp3ni3jDO+ipcjK+TiFhvM+skXJqjdfrJtQMprTWhDPRF9UFWM0Vy5Mk9OvOPcBrB4
 EoIRtiwyazNclPW45PHS6dwZkd0j4eEfnxN4WHoCUqdU8pEjJ/qDirB8NFTFrd0uOX9eagjKC1v
 7k204RjJesjtIztRW8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX7SU+Y/KYTEco
 VNbAi7urQPdwvdvx/pmV85P0MapUgNGi2NtON/EobbbXnZZjSM4TWonCBzob2zZJ9XKPTn8G8gS
 4p9nbxBxQHLITNX6Is2KJIVmJ1aVfXk=
X-Proofpoint-GUID: 3jx6TQsOUoJrClinrM_XCzKNP0De4QdN
X-Proofpoint-ORIG-GUID: 3jx6TQsOUoJrClinrM_XCzKNP0De4QdN
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab5c179 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Q7n_TknA2OIddNHkTQcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250001


On 9/22/2026 6:17 AM, Hans Verkuil wrote:
> Hi Deepa,
>
> On 16/09/2026 00:00, Deepa Guthyappa Madivalara wrote:
>> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
>> control type for signed 8-bit values. Add necessary support in
>> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
>> v4l2-ctrls-api.
> One reason I asked you to split up adding the type and the control is
> that this makes it easy to do a 'git grep V4L2_CTRL_TYPE_U8' and compare
> that with 'git grep V4L2_CTRL_TYPE_S8' and see if the same number of changes
> is made in documentation, headers, and core code.
>
> And I see that S8 support is missing in v4l2_ctrl_type_op_validate() and
> check_range(), so that has to be added in a v7.
>
> Regards,
>
> 	Hans

Acknowledged, updated in v7.
Thanks
Deepa

>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions        |  1 +
>>   Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |  4 ++++
>>   Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |  6 ++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 11 +++++++++++
>>   include/media/v4l2-ctrls.h                                    |  2 ++
>>   include/uapi/linux/videodev2.h                                |  2 ++
>>   7 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>   	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. Valid if
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to maximum
>>   	inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +	inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>>   	case V4L2_CTRL_TYPE_U8:
>>   	case V4L2_CTRL_TYPE_U16:
>>   	case V4L2_CTRL_TYPE_U32:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (ctrl->is_array)
>>   			return -EINVAL;
>>   		ret = check_range(ctrl->type, min, max, step, def);
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 9caca56478d1a97ccde582a2086e7039411b52ed..b78992e32e21c79b1c70ec673b81759c9ca84206 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		memset(ptr.p_s8 + from_idx, (u8)value, elems);
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> +	case V4L2_CTRL_TYPE_S8:
>> +		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
>>   
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>> @@ -2037,6 +2045,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
>>    * @p_s32:			Pointer to a 32-bit signed value.
>>    * @p_s64:			Pointer to a 64-bit signed value.
>>    * @p_u8:			Pointer to a 8-bit unsigned value.
>> @@ -61,6 +62,7 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>   		__s64 value64;
>>   		char __user *string;
>>   		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
>>   		__u16 __user *p_u16;
>>   		__u32 __user *p_u32;
>>   		__s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8	     = 0x0103,
>>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>   
>>
