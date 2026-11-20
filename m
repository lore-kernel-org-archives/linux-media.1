Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218316;
	b=VwTgy+eaqFsLujCkqw2xAoOgkZTI3NHqcxIDrgzSX1CHymL8c4glql/Qe2GwqGyQMvVy
	 BRnImAEzWAZ+rO/62Yw0E3cl6APS/QV+zQ4kjsm07UrQkixfVO8Bnch/ezNTJwwNUgK3r
	 xjWc6tr05ONuuaIn/aN8jEVseR//zPRLik6ZtPLfIVr6GqP2lQrB4rTGgsFGgPLeNUX6X
	 5ZYUTTxNroi0C1iM25Ae1i7avRihtVD3ONo2bt1IecvwfTbtEW7DtiRlJ4nsLoiQlgTAf
	 aYxgcIyt2NFqVY2i41uj6MLG5yOcm6Ud7LBakjjJ+6JbPam1hAM52JI8I0hsLVpXjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
	b=D/QX5ULCxjRZ82xHXjHnJzD3tagNGmgMs8N3EIv1Y+6NOG/xilKdUzBrSZzGieG63rqZ
	 Ic+J+3yoWXKiw/RN/x7+gXsIHNQjoM0iBeRhxiqO3UGSwwLs2rA9+M+Lh82bf5AZSChP7
	 8yFBdvCYNTSuEVOrlRWASel6vCHc3C6F1rZDlALqTsLNUYhCnkRML8/FOwZcBK6HZKU3i
	 1PWCyzThnnQ5q5wspmzhXMfnehicab8zBMcKChzqIdNi8duO1K3wyacWBr/bEjX6srkCv
	 zyV5fvcjkSMciq+G8r6Ui663vsuCtlD30fVCGR1pjskCPbxj71ocCKqtZsA5yBUTb1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwKTFDAC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JQB/QXYJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC46606A6BC
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC46606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwKTFDAC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQB/QXYJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKMU8po3058559
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4xSyU6EJ+T1zz5ShxMW3u6
	/dSlAPbOtpJKNFH9TQlEA=; b=lwKTFDACLwzsupeiPPRJSmcrg7v2QAKjq8q4xy
	CbdlRt2Uuk/j+6hS8UGwAGE+CuhYLgMHzNK8niCK/1qGdtcMNYxHsNFxvlD64T64
	b3DqsBj5eMTc4da26u3ZxqsFKhZ5p3/GCkQa2lgG9qjc+p0058G9xes7rSth6CXN
	J3UYZM77/lr0IL4PyD9/vQAsJLdXUY8tFLV5Tn9zjHRSbCqQ8GeYG9VGxJQhSzGp
	idkbEzajhcJsPYZ2jExuwsDLTXOzKZRLjH0rLiBKIHaRFfCTvbvG8BJTwztvFO5p
	zsnAZ/U5dV4SP9tVuuimxS5Zb6ZjYWatWmt7NsOzFdargVVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2y2986fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3838b531addso144507eec.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218307; x=1795823107; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
        b=JQB/QXYJxZ3WuyD4IVRUe9ofFmZ1jVvZ+5PF2Ub0aeq7BLh5F42mi24UcEQjNWIX70
         9bIU3UoArIYnOCIMRxGK6ql3kT+euqfyJgrqj1Xf8cfKXsOHHI6z4R4QUEy83wjtLyOj
         cSC4RlLjR5qYL8H2hoKRLu3nQ/OvLALLzP3aLaF0UpHlwgSlDtsrvigzYVDBlzzpeAju
         /cmyhgI0QhKrdN0s71X4wVXnA3hjc02QqWrzC8QrHG6Sd0evyk3sF+SYfjA4Z/bHhO75
         fSMVOc+ibCDL4/fpLs9Cr9skJIoOQUbRoazITXWaq4B3vj98IanQv7EacWHjfKWCvxAF
         bPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218307; x=1795823107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
        b=sP5rBjtjVh/mtYUV1wdUbLn+GbjAOfGbrIIXEVYN8DexpCD9V9eE3qxXxGCwx2R8AT
         ylbYlcNjNRXJcgzvjrnPv0bsaA7971IgGLX4H3UcZy+M39pywNnGFvqfYiRHWp90dTdC
         0Qy2IF1jbsj8TRZBB5d1HcivIJy9PAyMxJJCB0yP95p10+7jL/WIX8WniiX1DrQpOPiu
         ZZXHgdAFLS7tsJGNc9zB5Hz9h/navmiIAgXaFcjAIhYoUZgysISxxBIjX7DvcgoWWFIN
         yhCkHtzWmzpspyil6p4CxkW2VaaAOGkDi0dRtGmQnYkTELdLLnP/gnyfQoa4TpoED9Ew
         aIfQ==
X-Gm-Message-State: APuU4Z/C38n9b4DmxuEsELbUAUi7xXuBL07PYJZmO6p0O3CBLdsWM6T7
	3T6KWd7Hp1b1nucLszRRhaUVnu3riFsdKXfuJzxx5In+uaYlv/0vyYSWJTsFyAcv64QnhWcDRYu
	WC9HuvqnI1+bkrblv225xPX+b0xdFpBOy7+dpG+eEpo3bKOwx3KbBtS26XdIJxGSswg==
X-Gm-Gg: AZFdTZeQodHeRUGr9PNWWc/qE38Ez7bZgwh435xuHnRCorN+0lduFtYVx3hvShfjkdH
	Gsso/z0i6aNMRB8sd1iL+NQJGli5PWW7vQ19cN6scXeOlWDzIEYBkuG7dppYCf+U9uYSUem2eDi
	hVnhw2a8KSQihjuzbwXmup3urHuU/6dANz9iEhbbReOSHp/zcfXbYeAJYWFNIXSZfgo5lEL5GXs
	NA+CesRnMBCPhPyuzoL6j9X0uI9tfJ9eqo3rcLVxrtBXWWBNxTRDDCNg1EgCHsOTpPjsPi9bFyY
	NQBis9/IsxIBcK0ZPA29+ApoQMUAME2GhkAohYQN6UYoo+CS+vji8Zzt/QBeQPEu4De53fUXcUr
	hyCmH6YvveeKdSBZKAmxMD35AoXdL5B11WzS/Y2FP+lA9yC7IuAvBgJEFES5WjUWtgDeHlb3deq
	jslT52NChiYWRrwhUvumk1+7UmAMYnDhuJWQ==
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr6295636eec.2.1795218306389;
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr6295591eec.2.1795218305794;
        Fri, 20 Nov 2026 15:45:05 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:05 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v11 0/5] Implement Region of Interest(ROI) support
Date: Fri, 20 Nov 2026 15:45:01 -0800
Message-Id: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3bAGsC/3XSzWrDMAwA4FcpPi/Ftvy7095jjGLL8hpoky3Zw
 kbpu8/pYQ24vhgk8GdJ1oXNNPU0s+fdhU209HM/DiUQ4mnH8BiGd+r6VBJMcmm4EaajAQ/T2B9
 oCPFEnUrgNCrrIBArlz4myv3PTXx9K/Gxn7/G6ff2wCLWbJNaRMe7TBlRkTUZ4GWc5/3ndzjhe
 D7vy8FWcZF3xQpVKbIoBoyD7FNEyg0F7orjtQJFIQ7RSBlkUq6hqI0iRKWoogj0FKTiOsaWore
 KrhRdlETJK5V5RtvqyNwV/0AxRZE+JYUuIuaWYjeKrOdi1+nmYJWAkCVgQ3EbBXiluLUW9Nxl4
 ORN66f9vyI4rzvyRXEgUJZiNEbRUATfMI/Wjhcnoo4JbCx7Rw+c6/X6B0qaPRksAwAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=7510;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=vuvbM02Jw397PqVJCFo6HMCpDsTVFguB5riWZWCmN8k=;
 b=ySOp/VmfIJQVbybVM75RIyvjMJ/GePe6DCqs9GsA17tgrJ6K6zpVCRSMdxyG+s8UWt9pVVcJ0
 /cQguObGoq4BIcwrzSAMTQ7XxxjrHSFXqjvjGXwjp18bquDCTlZfaOO
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX0c7rhMc0MAYC
 DqBf6u+/Z6jbPM88BJg/KEbPEfNNhHixfPfqar60lvHu/S1p/lknZfPjhaSl4uJ66hQmAAyoWuY
 gkYmfqXqTO3GSXs4aGg/A22kBWR42D4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXxoBGepr4nmCU
 c+s8zUQP1/7tT8d0o7daaY2w5bIH1knz7EOwuIrk40ZxyGTM1XKEou3cv6XH8JuE9nBnbthz6g1
 8bJMkAvnAmeiEztgsr6iKAwaLSXEbDFwlEJYERduOzrL4zQvTzm+d9Tg8UN3JFseHroMdLxIkvk
 QmfVxYYmg13kttp5nXwk/e8tiP0QubMd0idQ3xDvw7zlBI5ge/m2zs42PvB7mV61BajGpN42MQw
 8C1RyWijHu95p3w/Kf826D0ergD6eSrHSWQwsds9YQeKP0PdWS48YDdwRB4BxGtPllay4x+5DeD
 8MJz2d3n/k+xJAWxACm4crHiTaUet5k4/YLkAEDqmhVLsbBrrjBDPR9RNafBidac9IRxNSNWEQ8
 9p6vvzFvshlP2NzPNeyOV8lnZreK/SkkOYzC+bBQxT/FkYS35b8fFn1DAGKfCuL+mrLIyk7wtm/
 bxQ0urDxhhBvLq9lLxQ==
X-Proofpoint-GUID: -uAzdCXgxut2W2dhnwFTXoQqzrty5yIr
X-Proofpoint-ORIG-GUID: -uAzdCXgxut2W2dhnwFTXoQqzrty5yIr
X-Authority-Analysis: v=2.4 cv=Z/J5j3RA c=1 sm=1 tr=0 ts=6b00db83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=l3oWgaDpQndWrbxot-sA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200094

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v11:
- Fix kernel test robot or Media CI issue.
- Rebase onto media-committers next
- Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202610182259.q2CvO4TK-lkp@intel.com/
- Link to v10: https://lore.kernel.org/r/20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com

Changes in v10:
- Do not enable ROI subscription for unsupported platforms (Bryan)
- Address comments to use BIT, DIV_ROUND_UP, ALIGN and others for clarity (Bryan)
- Link to v9: https://lore.kernel.org/r/20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com

Changes in v9:
- Fix Media CI error.
- Rebase onto media-committers next
- Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202610051710.bnOqLkUl-lkp@intel.com/
- Link to v8:
  https://lore.kernel.org/r/20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com

Changes in v8:
- Moved p_s8 below p_u8 (Hans)
- Update Documentation for V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (Nicolas)
- Update returns to a sngle line (Vishnu)
- Update n_shift calculation logic to ilog2 (Vishnu)
- Link to v7: https://lore.kernel.org/r/20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com

Changes in v7:
- Add V4L2_CTRL_TYPE_S8 to v4l2_ctrl_type_op_validate and check_range (Hans)
- Rebased onto media-committers next.
- Link to v6: https://lore.kernel.org/r/20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com

Changes in v6:
- Update documentation from custom to array, __s8 to __s8 array (Hans)
- Update documentation and handling for non MB Size aligned frame resolution (Hans)
- Rework patch 1 and 2 to add V4L2_CTRL_TYPE_S8 type first followed by ROI control (Hans)
- Simplify handling for V4L2_CTRL_TYPE_S8 in v4l2-ctrls-core.c (Hans)  
- Link to v5: https://lore.kernel.org/r/20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com

Changes in v5:
- Fix Media CI errors.
- Rebase onto media-committers next.
- Link to v4: https://lore.kernel.org/r/20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com

Changes in v4:

- Updated Documentaion, clean stray lines (Bryan)
- Use BIT(16) for header version (Bryan)
- Split patch3 in the series to reflect enumeration of
  the platform and adding metadata support and implementation (Bryan)
- Link to v3: https://lore.kernel.org/r/20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com

Changes in v3:
- Updated Documentation (Hans) 
- Reuse ROUND_TO_RANGE_RANGE for p_s8 (Hans)
- Rebase onto media-committers next.
- Link to v2: https://lore.kernel.org/r/20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com

Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (5):
      media: v4l2-core: add new control type V4L2_CTRL_TYPE_S8
      media: uapi: Introduce new control for video encoder ROI
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  27 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 114 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  19 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 452 insertions(+), 4 deletions(-)
---
base-commit: ccf78740d63813c452c035b57d17a650492562fa
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

